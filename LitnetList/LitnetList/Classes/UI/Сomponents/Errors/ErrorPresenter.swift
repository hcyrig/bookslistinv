//
//  ErrorPresenter.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol ErrorPresenter {
  
  func presentCommonError(_ message: String)
}

extension ErrorPresenter where Self: BasePresenter & ViewSupportable {
  
  private var errorView: ErrorView? { return internalView as? ErrorView }
  
  func presentCommonError(_ message: String) {
    errorView?.showCommonError(InfoBarError(description: message))
  }
}
