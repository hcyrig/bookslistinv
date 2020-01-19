//
//  ViewLifeCycleSupportable.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol ViewLifeCycleSupportable {
  
  func viewDidLoad()
  func viewDidAppear()
  func viewWillAppear()
}

extension ViewLifeCycleSupportable {
  
  func viewDidLoad() { }
  func viewDidAppear() { }
  func viewWillAppear() { }
}
