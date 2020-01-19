//
//  UIViewController+NavigationController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIViewController {
  
  var embeddedFromNavigation: BaseNavigationController {
    return BaseNavigationController(rootViewController: self)
  }
}
