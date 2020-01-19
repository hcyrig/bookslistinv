//
//  Bundle+Extension.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/19/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

// https://gist.github.com/malcommac/ecf108df7a8e6d65cd658cd0c265ebb7#file-plistfile-swift

extension Bundle {
  
  public enum Errors: Error {
    case fileNotFound
  }
  
  func infoPlist<Value: Codable>() throws -> Value {
    
    guard let infoDict = infoDictionary else { throw Errors.fileNotFound }
    let infoData = try JSONSerialization.data(withJSONObject: infoDict)
    return try JSONDecoder().decode(Value.self, from: infoData)
  }
}
