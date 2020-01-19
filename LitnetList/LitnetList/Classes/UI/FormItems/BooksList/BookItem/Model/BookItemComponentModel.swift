//
//  BookItemComponentModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

extension BookItemComponent {
  
  struct Model: FormItemModel {
    
    let title: CommonUI.TitleModel
    let author: CommonUI.TitleModel
    let genre: CommonUI.TitleModel
    
    let handle: EmptyClosureType
  }
}
