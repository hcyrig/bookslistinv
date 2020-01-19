//
//  Crypto.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/19/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation
import CommonCrypto

// get it from https://stackoverflow.com/questions/55484384/swift-5-kccdecrypt-commoncrypto-failing-to-decrypt

protocol Cryptable {
  func encrypt(_ data: Data) throws -> Data
  func decrypt(_ data: Data) throws -> Data
}

struct AES {
  private let key: Data
  private let ivSize: Int         = kCCBlockSizeAES128
  private let options: CCOptions  = CCOptions(kCCOptionPKCS7Padding)
  
  init(keyString: String) throws {
    guard keyString.count == kCCKeySizeAES256 else {
      throw Error.invalidKeySize
    }
    self.key = Data(keyString.utf8)
  }
}

extension AES {
  enum Error: Swift.Error {
    case invalidKeySize
    case generateRandomIVFailed
    case encryptionFailed
    case decryptionFailed
    case dataToStringFailed
  }
}

private extension AES {
  
  func generateRandomIV(for data: inout Data) throws {
    
    try data.withUnsafeMutableBytes { dataBytes in
      
      guard let dataBytesBaseAddress = dataBytes.baseAddress else {
        throw Error.generateRandomIVFailed
      }
      
      let status: Int32 = SecRandomCopyBytes(
        kSecRandomDefault,
        kCCBlockSizeAES128,
        dataBytesBaseAddress
      )
      
      guard status == 0 else {
        throw Error.generateRandomIVFailed
      }
    }
  }
}

extension AES: Cryptable {
  
  func encrypt(_ data: Data) throws -> Data {
    let dataToEncrypt = data
    
    let bufferSize: Int = ivSize + dataToEncrypt.count + kCCBlockSizeAES128
    var buffer = Data(count: bufferSize)
    try generateRandomIV(for: &buffer)
    
    var numberBytesEncrypted: Int = 0
    
    do {
      try key.withUnsafeBytes { keyBytes in
        try dataToEncrypt.withUnsafeBytes { dataToEncryptBytes in
          try buffer.withUnsafeMutableBytes { bufferBytes in
            
            guard let keyBytesBaseAddress = keyBytes.baseAddress,
              let dataToEncryptBytesBaseAddress = dataToEncryptBytes.baseAddress,
              let bufferBytesBaseAddress = bufferBytes.baseAddress else {
                throw Error.encryptionFailed
            }
            
            let cryptStatus: CCCryptorStatus = CCCrypt( // Stateless, one-shot encrypt operation
              CCOperation(kCCEncrypt),                // op: CCOperation
              CCAlgorithm(kCCAlgorithmAES),           // alg: CCAlgorithm
              options,                                // options: CCOptions
              keyBytesBaseAddress,                    // key: the "password"
              key.count,                              // keyLength: the "password" size
              bufferBytesBaseAddress,                 // iv: Initialization Vector
              dataToEncryptBytesBaseAddress,          // dataIn: Data to encrypt bytes
              dataToEncryptBytes.count,               // dataInLength: Data to encrypt size
              bufferBytesBaseAddress + ivSize,        // dataOut: encrypted Data buffer
              bufferSize,                             // dataOutAvailable: encrypted Data buffer size
              &numberBytesEncrypted                   // dataOutMoved: the number of bytes written
            )
            
            guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
              throw Error.encryptionFailed
            }
          }
        }
      }
      
    } catch {
      throw Error.encryptionFailed
    }
    
    return buffer[..<(numberBytesEncrypted + ivSize)]
  }
  
  func decrypt(_ data: Data) throws -> Data {
    
    let bufferSize: Int = data.count - ivSize
    var buffer = Data(count: bufferSize)
    
    var numberBytesDecrypted: Int = 0
    
    do {
      try key.withUnsafeBytes { keyBytes in
        try data.withUnsafeBytes { dataToDecryptBytes in
          try buffer.withUnsafeMutableBytes { bufferBytes in
            
            guard let keyBytesBaseAddress = keyBytes.baseAddress,
              let dataToDecryptBytesBaseAddress = dataToDecryptBytes.baseAddress,
              let bufferBytesBaseAddress = bufferBytes.baseAddress else {
                throw Error.encryptionFailed
            }
            
            let cryptStatus: CCCryptorStatus = CCCrypt( // Stateless, one-shot encrypt operation
              CCOperation(kCCDecrypt),                // op: CCOperation
              CCAlgorithm(kCCAlgorithmAES128),        // alg: CCAlgorithm
              options,                                // options: CCOptions
              keyBytesBaseAddress,                    // key: the "password"
              key.count,                              // keyLength: the "password" size
              dataToDecryptBytesBaseAddress,          // iv: Initialization Vector
              dataToDecryptBytesBaseAddress + ivSize, // dataIn: Data to decrypt bytes
              bufferSize,                             // dataInLength: Data to decrypt size
              bufferBytesBaseAddress,                 // dataOut: decrypted Data buffer
              bufferSize,                             // dataOutAvailable: decrypted Data buffer size
              &numberBytesDecrypted                   // dataOutMoved: the number of bytes written
            )
            
            guard cryptStatus == CCCryptorStatus(kCCSuccess) else {
              throw Error.decryptionFailed
            }
          }
        }
      }
    } catch {
      throw Error.encryptionFailed
    }
    
    return buffer[..<numberBytesDecrypted]
  }
}
