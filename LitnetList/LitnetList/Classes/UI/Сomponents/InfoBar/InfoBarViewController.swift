//
//  InfoAlertViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class InfoBarViewController: BaseBottomBarViewController {
  
  @IBOutlet private weak var infoTextView: UITextView!
  
  var viewModel: InfoBarContent!
  
  override func setupInterface() {
    super.setupInterface()
    
    setupDescription()
  }
  
  private func setupDescription() {
    infoTextView.attributedText = viewModel.getAttributedText()
    infoTextView.backgroundColor = .white
  }
}

extension InfoBarViewController: ViewModelBindable {
  
  typealias ViewModel = InfoBarContent
  
  func bind(viewModel: InfoBarContent) {
    self.viewModel = viewModel
    
    setupDescription()
  }
}
