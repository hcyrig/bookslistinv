//
//  XibReflection.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol XibReflection { func fireXibReflection() }

// MARK: - Describable -
extension XibReflection where Self: UIView & NibUncoder {
  
  private var containerView: UIView { return self }
  private var xibReflectionView: UIView? { return type(of: self).viewFromNib(withOwner: self) }
  
  private func clearContainerColor() { backgroundColor = .clear }
  
  func fireXibReflection() {
    
    guard let xibReflectionView = xibReflectionView else { return }
    xibReflectionView.edgesToSuperView(containerView)
    
    clearContainerColor()
  }
}

// MARK: - XibReflection & Describable -
class XibReflectionView: BaseView, XibReflection & NibUncoder {
  
  @IBOutlet var containerView: UIView!
  
  override func commonInterfaceConfiguration(_ state: InterfaceConfiguration) {
    super.commonInterfaceConfiguration(state)
    
    if case .loaded = state { return }
    
    fireXibReflection()
  }
}
