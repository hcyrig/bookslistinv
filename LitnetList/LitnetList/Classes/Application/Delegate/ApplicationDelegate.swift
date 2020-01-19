//
//  ApplicationDelegate.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol ApplicationDelegate: class {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  func applicationWillTerminate(_ application: UIApplication)
  func applicationWillEnterForeground(_ application: UIApplication)
  func applicationDidEnterBackground(_ application: UIApplication)
  func applicationDidBecomeActive(_ application: UIApplication)
  func applicationWillResignActive(_ application: UIApplication)
  func applicationDidRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data)
  func applicationDidFailToRegisterForRemoteNotificationsWithError(_ error: Error)
}

extension ApplicationDelegate {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
  func applicationWillTerminate(_ application: UIApplication) {}
  func applicationWillEnterForeground(_ application: UIApplication) {}
  func applicationDidEnterBackground(_ application: UIApplication) {}
  func applicationDidBecomeActive(_ application: UIApplication) {}
  func applicationWillResignActive(_ application: UIApplication) {}
  func applicationDidRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data) {}
  func applicationDidFailToRegisterForRemoteNotificationsWithError(_ error: Error) {}
}
