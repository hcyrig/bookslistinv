//
//  AppDelegate.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: ProxyApplicationDelegate {
  
  var window: UIWindow?
  
  override var delegates: [ApplicationDelegate] { return storedDelegates }
  
  private let storedDelegates: [ApplicationDelegate] = [ UserInterfaceAppDelegate() ]
}
