//
//  UIScrollView+FlippedPage.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIScrollView {
  
  var flippedPage: Int {
    let x = contentOffset.x
    let width = bounds.size.width
    return Int(round(x/width))
  }
}
