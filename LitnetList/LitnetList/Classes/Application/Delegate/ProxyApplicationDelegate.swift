//
//  ProxyApplicationDelegate.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class ProxyApplicationDelegate: UIResponder, UIApplicationDelegate {
  
  var delegates: [ApplicationDelegate] { return [] }
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    delegates.forEach { $0.application(application, didFinishLaunchingWithOptions: launchOptions) }
    return true
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    
    delegates.forEach { $0.applicationWillTerminate(application) }
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    
    delegates.forEach { $0.applicationWillEnterForeground(application) }
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    
    delegates.forEach { $0.applicationDidEnterBackground(application) }
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    
    delegates.forEach { $0.applicationDidBecomeActive(application) }
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    
    delegates.forEach { $0.applicationWillResignActive(application) }
  }
  
  func application(_ application: UIApplication,
                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    
    delegates.forEach { $0.applicationDidRegisterForRemoteNotificationsWithDeviceToken(deviceToken) }
  }
  
  func application(_ application: UIApplication,
                   didFailToRegisterForRemoteNotificationsWithError error: Error) {
    
    delegates.forEach { $0.applicationDidFailToRegisterForRemoteNotificationsWithError(error) }
  }
}
