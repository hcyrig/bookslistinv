//
//  UIDevice+Extension.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/18/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UIDevice {
  
  static var identifier: String { UIDevice.current.identifierForVendor!.uuidString }
  static var osTypeMark: String { return "android" }
}
