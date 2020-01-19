//
//  BookListBackendService.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import PromiseKit

protocol BookListBackendService {
  
  func getBookList() -> Promise<[TransferBookModel]>
  func getChapters(bookId: String) -> Promise<[TransferСhapterModel]>
  
  func decodeChapters(chapters: [TransferСhapterModel]) -> [TransferСhapterModel]
}
