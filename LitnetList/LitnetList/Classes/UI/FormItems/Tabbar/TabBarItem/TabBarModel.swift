//
//  TabBarModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol TabBarItem {
  
  typealias TabBarItemAction = (() -> Bool)
  
  var title: String { get }
  var actionHandler: TabBarItemAction? { get set }
  
  init(title: String)
}

struct TabBarModel: TabBarItem {
  
  let title: String
  var actionHandler: TabBarItemAction?
  
  init(title: String) {
    
    self.title = title
  }
}
