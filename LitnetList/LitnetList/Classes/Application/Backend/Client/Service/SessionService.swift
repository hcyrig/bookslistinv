//
//  SessionService.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class SessionService {

  let reequiresModel: RequiresModel! = try? Bundle.main.infoPlist()
  
  private static let userDefaultsTokenKey = "SessionAuthToken"
  
  static func saveToken(_ token: String) {
    UserDefaults.standard.set(token, forKey: SessionService.userDefaultsTokenKey)
  }
  
  static func getToken() -> String? {
    return UserDefaults.standard.value(forKey: SessionService.userDefaultsTokenKey) as? String
  }
}
