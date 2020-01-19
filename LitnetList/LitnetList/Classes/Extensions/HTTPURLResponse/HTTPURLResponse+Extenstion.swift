//
//  HTTPURLResponse+Extenstion.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
  
  var family: HTTPError.StatusCode { return .init(statusCode) }
  
  var isSuccessful: Bool { family == .successful }
}
