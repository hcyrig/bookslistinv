//
//  UIViewController+InfoBar.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func presentInfoBar(_ viewModel: InfoBarContent) -> InfoBarViewController {
    
    let infoBar = InfoBarViewController.loadFromNib()
    infoBar.viewModel = viewModel
    
    infoBar.modalPresentationStyle = .overFullScreen
    present(infoBar, animated: false, completion: nil)
    
    return infoBar
  }
}
