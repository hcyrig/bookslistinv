//
//  UIView+Configuration.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

enum InterfaceConfiguration {
  case loaded
  case instantiated(frame: CGRect)
  case decoded(decoder: NSCoder)
}

protocol InterfaceElementCofiguration {
  func commonInterfaceConfiguration(_ state: InterfaceConfiguration)
  func commonInterfacePreConfiguration(_ state: InterfaceConfiguration)
}

class BaseView: UIView, InterfaceElementCofiguration {
  
  func commonInterfaceConfiguration(_ state: InterfaceConfiguration) { }
  func commonInterfacePreConfiguration(_ state: InterfaceConfiguration) { }
  
  override open func awakeFromNib() {
    commonInterfacePreConfiguration(.loaded)
    super.awakeFromNib()
    commonInterfaceConfiguration(.loaded)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInterfaceConfiguration(.instantiated(frame: frame))
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInterfaceConfiguration(.decoded(decoder: aDecoder))
  }
}
