//
//  BasePresenter.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

class BasePresenter {
  
  let router: Router
  
  init(router: Router) {
    self.router = router
  }
}

extension BasePresenter: Presenter { }
