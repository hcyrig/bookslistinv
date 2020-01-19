//
//  TitleViewModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/17/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

extension CommonUI {
  
  struct TitleViewModel {
    
    let text: String
    let font: FontModel
    
    init(model: TitleModel,
         font: FontModel = .init()) {
      
      text = model.text
      self.font = font
    }
  }
}
