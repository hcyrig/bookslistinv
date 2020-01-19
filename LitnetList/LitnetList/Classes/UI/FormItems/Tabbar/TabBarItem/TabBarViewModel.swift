//
//  TabBarViewModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

struct TabBarViewModel {
  
  let title: String
  let viewController: UIViewController?
  var actionHandler: TabBarModel.TabBarItemAction?
  
  init(model: TabBarItem, controller: UIViewController? = nil) {
    
    self.title = model.title
    
    if let viewController = controller {
      self.viewController = BaseNavigationController(rootViewController: viewController)
      self.viewController?.tabBarItem = UITabBarItem(title: self.title,
                                                     image: nil,
                                                     selectedImage: nil)
    } else {
      self.viewController = nil
    }
    
    self.actionHandler = model.actionHandler
  }
}
