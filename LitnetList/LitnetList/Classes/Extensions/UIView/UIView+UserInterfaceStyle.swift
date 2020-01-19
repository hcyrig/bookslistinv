//
//  UIView+UserInterfaceStyle.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIView {
  
  func restrictSystemThemeChanging() {
    if #available(iOS 13.0, *) { overrideUserInterfaceStyle = UIUserInterfaceStyle.light }
  }
}
