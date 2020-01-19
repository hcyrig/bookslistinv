//
//  ErrorView.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol ErrorView {
  func showCommonError(_ content: InfoBarContent)
}

extension ErrorView where Self: UIViewController {
  func showCommonError(_ content: InfoBarContent) { _ = presentInfoBar(content) }
}
