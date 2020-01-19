//
//  ReaderViewModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

struct ReaderViewModel {
  
  let text: CommonUI.TitleViewModel
}

extension ReaderViewModel {
  
  init(_ model: ReaderModel, font: CommonUI.FontModel = .init()) {
    
    self.text = CommonUI.TitleViewModel(model: model.text, font: font)
  }
}
