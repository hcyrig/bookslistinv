//
//  Storyboards.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

enum Storyboards: String {
  
  case form = "Form"
  case tab = "Tab"
  case reader = "Reader"
  
  var controller: UIViewController {
    let storyboard = UIStoryboard(name: rawValue, bundle: nil)
    return storyboard.instantiateInitialViewController()!
  }
  
  func initialController<ViewController: UIViewController>() -> ViewController {
    let storyboard = UIStoryboard(name: rawValue, bundle: nil)
    return storyboard.instantiateInitialViewController() as! ViewController
  }
}
