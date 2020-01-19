//
//  TransferBookModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/17/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

struct TransferBookModel: Decodable {
  
  struct LibInfo: Decodable {
    
    let type: Int?
    var infoType: LibType? { return LibType(rawValue: type ?? 0) }
  }
  
  struct Book: Decodable {
    
    let title: String
    let author_name: String
    let type: String
    var id: Int
  }
  
  var lib_info: LibInfo
  var book: Book
}
