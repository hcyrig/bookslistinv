//
//  LibType.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/19/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

enum LibType: Int {
  
  case read
  case archive
  case mark
  
  var title: String {
    switch self {
    case .read: return "Read"
    case .archive: return "Archive"
    case .mark: return "Mark"
    }
  }
}
