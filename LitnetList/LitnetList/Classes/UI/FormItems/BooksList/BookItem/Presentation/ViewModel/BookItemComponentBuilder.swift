//
//  BookItemComponentBuilder.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/17/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension BookItemComponent {
  
  struct Builder: FormItemBuilder {
    
    private var model: BookItemComponent.Model
    
    var item: FormItemModel { return model }
    
    var itemViewModel: FormItemViewModel {
      
      let titleFont = CommonUI.FontModel(color: .black, type: .regular)
      let authorFont = CommonUI.FontModel(color: .darkGray, type: .option)
      let genrreFont = CommonUI.FontModel(color: .gray, type: .small)
      
      return BookItemComponent.ViewModel(model: model,
                                         titleFont: titleFont,
                                         authorFont: authorFont,
                                         genreFont: genrreFont)
    }
    init(model: BookItemComponent.Model) {
      self.model = model
    }
  }
}
