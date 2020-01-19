//
//  AlamofireHttpClient.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Alamofire
import PromiseKit

private class RequestModel {
  
  let method: HTTPMethod
  let path: String
  let parameters: [String: Any]?
  let encoding: ParameterEncoding
  
  init(method: HTTPMethod,
       path: String,
       parameters: [String: Any]?,
       encoding: ParameterEncoding) {
    
    self.method = method
    self.path = path
    self.parameters = parameters
    self.encoding = encoding
  }
}

class AlamofireHttpClient: HttpClient {
  
  typealias HttpClientResponse = (urlRequest: URLRequest, urlResponse: HTTPURLResponse, data: Data)
  
  let baseUrl: URL
  let decoder: DecoderValue
  var headers = [String: String]()
  
  required init(baseUrl: URL, decoder: DecoderValue) {
    self.baseUrl = baseUrl
    self.decoder = decoder
  }
  
  func addHeader(_ name: String, value: String) {
    headers[name] = value
  }
  func removeHeader(_ name: String) {
    headers[name] = nil
  }
  
  private func absolutePath(_ relativePath: String) -> URL {
    guard !relativePath.isEmpty else {return baseUrl}
    assert(relativePath.first != "/", "'/' symbol at the begining of url relativePath will cause 'RestrictedIP' error")
    guard let url = URL(string: relativePath, relativeTo: baseUrl) else {
      assertionFailure("failed to construct url for path \(relativePath)")
      return baseUrl
    }
    return url
  }
  
  private func handleResponse(
    response: HttpClientResponse)
    throws -> Promise<Any> {
      
      let serialization = Request.serializeResponseJSON(options: .allowFragments,
                                                        response: response.urlResponse,
                                                        data: response.data,
                                                        error: nil)
      switch serialization {
      case .success(let value):
        
        let pmkaResponse = DefaultDataResponse(request: response.urlRequest,
                                               response: response.urlResponse,
                                               data: response.data, error: nil)
        print(pmkaResponse)
        
        if !response.urlResponse.isSuccessful {
          try handleError(value: value, statusCode: response.urlResponse.statusCode) }
        
        return .value(value)
        
      case .failure(let error):
        
        print(error)
        
        switch error {
          
        case AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength):
          
          throw HTTPError.empty(statusCode: response.urlResponse.statusCode,
                                response: response.urlResponse)
          
        default: throw HTTPError.validation(statusCode: response.urlResponse.statusCode,
                                            response: response.urlResponse) }
      }
  }
  
  private func handleError(value: Any,
                           statusCode: Int) throws {
    
    throw HTTPError.validation(statusCode: statusCode, response: value as? CustomStringConvertible)
  }
  
  private func execute(_ requestModel: RequestModel) -> (promise: Promise<Any>, cancel: EmptyClosureType) {
    
    let request = Alamofire.request(absolutePath(requestModel.path),
                                    method: requestModel.method,
                                    parameters: requestModel.parameters,
                                    encoding: requestModel.encoding,
                                    headers: headers)
    
    let promise = Promise<Void>()
      
      .then(on: .global()) { _ -> Promise<(URLRequest, HTTPURLResponse, Data)> in
        
        print(request.request ?? "")
        
        return request.response(.promise) }
      
      .then(on: .global() ) { request, response, data -> Promise<Any> in
        
        return try self.handleResponse(response: (request, response, data)) }
    
    promise.catch { error in print(error) }
    
    return (promise, request.cancel)
  }
}

// MARK: - Requests -

extension AlamofireHttpClient {
  
  func get(path: String,
           parameters: [String: Any]?) -> Promise<Any> {
    
    let request = RequestModel(method: .get,
                               path: path,
                               parameters: parameters,
                               encoding: URLEncoding.default)
    
    return execute(request).promise
  }
  
  func post(path: String,
            parameters: [String: Any]?) -> Promise<Any> {
    
    let request = RequestModel(method: .post,
                               path: path,
                               parameters: parameters,
                               encoding: JSONEncoding.default)
    
    return execute(request).promise
  }
}
