//
//  BookListBackendServiceImplementation.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import PromiseKit

final class BookListBackendServiceImplementation: BackendServiceImplementation, BookListBackendService {
  
  private let bookListPath = "library/get"
  private let bookTextPath = "book/get-text"
  
  func getChapters(bookId: String) -> Promise<[TransferСhapterModel]> {
    
    return client.get(path: bookTextPath + "/" + bookId,
                      parameters: params(userToken: service.reequiresModel.LSecBundleApplicationRequires.Transportu))
      
      .then({ response -> Promise<[TransferСhapterModel]> in
        
        return .value(try self.clientDecoder.decode(
          [TransferСhapterModel].self,
          from: response))
      })
  }
  
  func decodeChapters(chapters: [TransferСhapterModel]) -> [TransferСhapterModel] {
    
    var decriptedChapters: [TransferСhapterModel] = []
    chapters.forEach {
      var chapter = $0
      if let text = chapter.text {
        chapter.text = decodeText(string: text)
        decriptedChapters.append(chapter)
      }
    }
    return decriptedChapters
  }
  
  func decodeText(string: String) -> String {
    guard
      let encryptedData = Data(base64Encoded: string),
      let decryptedData = decodeData(data: encryptedData),
      let json = try? JSONSerialization.jsonObject(
        with: decryptedData,
        options: .fragmentsAllowed),
      let array = json as? [String],
      let string = array.first else { return "" }
    
    return string
  }
  
  func getBookList() -> Promise<[TransferBookModel]> {
    
    return client.get(path: bookListPath,
                      parameters: params(userToken: service.reequiresModel.LSecBundleApplicationRequires.Transportu))
      
      .then({ response -> Promise<[TransferBookModel]> in
        
        return .value(try self.clientDecoder.decode(
          [TransferBookModel].self,
          from: response))
      })
  }
}
