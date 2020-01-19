//
//  HttpErrorService.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

enum HTTPError: Error, CustomStringConvertible {
  
  enum StatusCode {
    
    case informatinal
    case successful
    case redirection
    case client
    case server
    case unknown
    
    init(_ code: Int) {
      switch code {
      case 100...199: self = .informatinal
      case 200...299: self = .successful
      case 300...399: self = .redirection
      case 400...499: self = .client
      case 500...599: self = .server
      default: self = .unknown
      }
    }
  }
  
  case validation(statusCode: Int, response: CustomStringConvertible?)
  case parsing(response: Any)
  
  case empty(statusCode: Int?, response: CustomStringConvertible?)
  
  var description: String {
    
    var description = ""
    
    switch self {
    case let .validation(statusCode, response):
      description = "Response: \(response ?? "Unresolved data.")" + "\nStatus code: \(statusCode)"
    case let .parsing(response):
      description = "Response: \(response as? CustomStringConvertible ?? "Unresolved data.")"
    case let .empty(statusCode, response):
      let httpStatusCode = statusCode ?? 0
      description = "Empty: \(response ?? "Unresolved data."). Code: \(httpStatusCode)."
    }
    
    return description
  }
}
extension Error {
  
  var code: Int? {
    
    if let error = self as? HTTPError {
      switch error {
      case .validation(let code, _): return code
      case .parsing: return nil
      case .empty(let code, _): return code
      }
    }
    return nil
  }
  
  var message: String {
    if let error = self as? HTTPError {
      
      switch error {
      default: return error.description
      }
      
    } else if let error = self as? DecoderError {
      
      return error.description
      
    }
    return "Not descriable system error"
  }
}

extension Error {
  
  var statusCode: HTTPError.StatusCode? {
    
    guard let code = self.code else { return nil }
    return .init(code)
  }
}
