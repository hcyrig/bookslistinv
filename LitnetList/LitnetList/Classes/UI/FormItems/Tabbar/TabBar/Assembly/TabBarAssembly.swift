//
//  TabBarAssembly.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class TabBarAssembly: TabBarController {
  
  class func createModule(_ context: Context? = nil) -> TabBarController {
    
    let view = Storyboards.tab.controller as! TabBarController
    let router = Router(view: view)
    let presenter = TabBarPresenterImplementation(router: router,
                                                  view: view)
    
    let interactor = TabBarInteractorImplementation(
      presenter: presenter,
      context: context)
    
    view.interactor = interactor
    
    return view
  }
}
