//
//  BookItemComponentViewModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/17/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension BookItemComponent {
  
  struct ViewModel: FormItemViewModel {
    
    var title: CommonUI.TitleViewModel
    var author: CommonUI.TitleViewModel
    var genre: CommonUI.TitleViewModel
    
    let handle: EmptyClosureType
    
    init(model: BookItemComponent.Model,
         titleFont: CommonUI.FontModel = .init(),
         authorFont: CommonUI.FontModel = .init(),
         genreFont: CommonUI.FontModel = .init()) {
      
      self.title = CommonUI.TitleViewModel(model: model.title, font: titleFont)
      self.author = CommonUI.TitleViewModel(model: model.author, font: authorFont)
      self.genre = CommonUI.TitleViewModel(model: model.genre, font: genreFont)
      
      self.handle = model.handle
    }
    
    var cell: UITableViewCell.Type {
      return BookItemTableViewCell.self
    }
  }
}
