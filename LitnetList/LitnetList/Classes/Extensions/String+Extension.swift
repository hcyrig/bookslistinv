//
//  String+Extension.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/18/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

extension String {
  
  var htmlToAttributedString: NSAttributedString? {
      guard let data = data(using: .utf8) else { return NSAttributedString() }
      do {
          return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
      } catch {
          return NSAttributedString()
      }
  }
  var htmlToString: String {
      return htmlToAttributedString?.string ?? ""
  }
  
  static func MD5(string: String) -> Data {
      let length = Int(CC_MD5_DIGEST_LENGTH)
      let messageData = string.data(using:.utf8)!
      var digestData = Data(count: length)

      _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
          messageData.withUnsafeBytes { messageBytes -> UInt8 in
              if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                  let messageLength = CC_LONG(messageData.count)
                  CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
              }
              return 0
          }
      }
      return digestData
  }
  
  static func MD5Hex(string: String) -> String {
      return MD5(string: string).map { String(format: "%02hhx", $0) }.joined()
  }
  
  static func MD5Base64(string: String) -> String {
    return MD5(string: string).base64EncodedString()
  }
}
