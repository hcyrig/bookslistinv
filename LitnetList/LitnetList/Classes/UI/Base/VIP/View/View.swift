//
//  View.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/18/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol ViewSupportable {
  var internalView: View? { get }
}

protocol View: class { }
