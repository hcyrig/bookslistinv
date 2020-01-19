//
//  HttpClient.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import PromiseKit

protocol HttpClient {
  
  var decoder: DecoderValue { get }
  
  func addHeader(_ name: String, value: String)
  func removeHeader(_ name: String)
  
  func get(path: String, parameters: [String: Any]?) -> Promise<Any>
  func post(path: String, parameters: [String: Any]?) -> Promise<Any>
}

extension HttpClient {
  
  func get(path: String,
           parameters: [String: Any]? = nil) -> Promise<Any> {
    return get(path: path, parameters: parameters)
  }
  
  func post(path: String,
            parameters: [String: Any]? = nil) -> Promise<Any> {
    return post(path: path, parameters: parameters)
  }
}
