//
//  BaseAssembly.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

class BaseAssembly<ViewController: BaseViewController> {
  
  class func createModule(_ context: Context? = nil) -> ViewController {
    return .init()
  }
}
