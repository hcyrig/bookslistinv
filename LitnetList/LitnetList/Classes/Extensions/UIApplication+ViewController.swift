//
//  UIApplication+ViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIApplication {
  
  var visibleViewController: UIViewController? {
    
    guard let rootViewController = keyWindow?.rootViewController else { return nil }
    return getVisibleViewController(rootViewController)
  }
  
  private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
    
    if let presentedViewController = rootViewController.presentedViewController {
      return getVisibleViewController(presentedViewController)
    }
    if let navigationController = rootViewController as? UINavigationController,
      let visibleViewController = navigationController.visibleViewController {
      return getVisibleViewController(visibleViewController)
    }
    if let tabBarController = rootViewController as? UITabBarController,
      let selectedViewController = tabBarController.selectedViewController {
      return getVisibleViewController(selectedViewController)
    }
    return rootViewController
  }
}
