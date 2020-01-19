//
//  ErrorHandler.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol ErrorHandler: ErrorPresenter {
  func handle(error: Error, context: Context?)
}

extension ErrorHandler {
  
  func handle(error: Error, context: Context?) {
    
    if error.statusCode == .successful { return }
    
    presentCommonError(error.message)
  }
}
