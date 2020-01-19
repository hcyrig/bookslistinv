//
//  UIViewController+Nib.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIViewController {
  
  static func loadFromNib() -> Self {
    func instantiateFromNib<T: UIViewController>() -> T {
      return T(nibName: String(describing: T.self), bundle: nil)
    }
    return instantiateFromNib()
  }
}
