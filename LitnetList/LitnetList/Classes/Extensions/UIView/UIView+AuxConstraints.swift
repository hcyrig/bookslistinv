//
//  UIView+AuxConstraints.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit
import TinyConstraints

extension UIView {
  
  func edgesToSuperView(_ superView: UIView) {
    superView.addSubview(self)
    edgesToSuperview()
  }
}
