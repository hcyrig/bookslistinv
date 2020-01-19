//
//  UIViewController+Containment.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func add(asChild module: UIViewController,
           container: UIView? = nil,
           fromBounds: Bool = false) {
    
    self.addChild(module)
    
    let containerView = container ?? self.view
    containerView!.addSubview(module.view)
    
    if fromBounds {
      module.view.frame = containerView!.bounds
      module.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    module.didMove(toParent: self)
  }
  
  func remove(asChild module: UIViewController) {
    
    module.willMove(toParent: nil)
    
    module.view.removeFromSuperview()
    module.removeFromParent()
  }
  
  func removeChilds() {
    
    children.forEach {
      self.remove(asChild: $0)
    }
  }
  
  func add(_ child: UIViewController,
           frame: CGRect? = nil,
           animated: Bool = false) {
    
    addChild(child)
    
    if let frame = frame {
      child.view.frame = frame
    }
    
    view.addSubview(child.view)
    child.didMove(toParent: self)
    
    if animated {
      child.view.alpha = 0
      UIView.animate(withDuration: 0.33) {
        child.view.alpha = 1
      }
    }
  }
  
  func remove() {
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
}
