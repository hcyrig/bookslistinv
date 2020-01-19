//
//  FontModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/17/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit.UIColor

extension CommonUI {
  
  struct FontModel {
    
    enum FontType {
      
      case regular
      
      case large
      case middle
      case small
      
      case option
      
      var size: CGFloat {
        switch self {
        case .regular: return 16
        case .large: return 32
        case .middle: return 27
        case .small: return 12
        case .option: return 14
        }
      }
      
      var font: UIFont { return font() }
      
      func font(_ weight: UIFont.Weight? = nil) -> UIFont {
        if let weight = weight {
          return .systemFont(ofSize: self.size, weight: weight)
        }
        return .systemFont(ofSize: self.size)
      }
    }
    
    let color: UIColor
    let type: FontType
    
    init(color: UIColor = .black,
         type: FontType = .regular) {
      
      self.color = color
      self.type = type
    }
  }
}
