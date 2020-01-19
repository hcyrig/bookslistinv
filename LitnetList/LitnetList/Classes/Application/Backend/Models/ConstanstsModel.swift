//
//  ConstanstsModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/19/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

struct RequiresModel: Codable {
  
  struct Requires: Codable {
    
    let Transportp: String
    let Transportc: String
    let Transportu: String
    let Transportt: String
  }
  var LSecBundleApplicationRequires: Requires
}
