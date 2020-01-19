//
//  BaseViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupInterface()
  }
  
  func setupInterface() { }
}

// MARK: - View -
extension BaseViewController: View { }
