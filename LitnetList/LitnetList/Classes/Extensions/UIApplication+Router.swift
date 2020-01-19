//
//  UIApplication+Router.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIApplication {
  
  var routerForVisibleViewController: Router? {
    
    guard let visibleViewController = visibleViewController else { return nil }
    return Router(view: visibleViewController)
  }
  
  static var window: UIWindow? {
    
    get { return UIApplication.shared.delegate?.window! }
    set { (UIApplication.shared.delegate as? AppDelegate)?.window = newValue }
  }
  
  static var rootViewController: UIViewController? {
    return UIApplication.window?.rootViewController
  }
  
  func initializeRootViewController(_ view: UIViewController,
                                    embeddedFromNavigation: Bool = false) {
    
    guard let mainWindow = (delegate as? AppDelegate)?.window else { return }
    mainWindow.restrictSystemThemeChanging()
    mainWindow.rootViewController = embeddedFromNavigation ? view.embeddedFromNavigation : view
    mainWindow.makeKeyAndVisible()
  }
}
