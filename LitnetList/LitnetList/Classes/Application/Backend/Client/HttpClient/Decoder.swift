//
//  Decoder.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

class DictionaryDecoder: DecoderValue {
  
  private let decoder = JSONDecoder()
  
  func decode<T>(_ type: T.Type, from data: Any) throws -> T where T: Decodable {
    guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
      throw DecoderError.parsing(response: data)
    }
    
    do {

      return try decoder.decode(type, from: jsonData) }
    
    catch(let error) {
      
      print(error)
      if jsonData.isEmpty { throw DecoderError.empty }
      throw DecoderError.parsing(response: data) }
  }
}

enum DecoderError: Error, CustomStringConvertible {
  
  case parsing(response: Any)
  case empty
  
  var description: String {
    var description = ""
    
    switch self {
    case let .parsing(response):
      description = "Response: \(response as? CustomStringConvertible ?? "Unresolved data.")"
    case .empty:
      description = "Response: empty body of data"
    }
    
    return description
  }
}

protocol DecoderValue {
  func decode<T>(_ type: T.Type, from data: Any) throws -> T where T: Decodable
}
