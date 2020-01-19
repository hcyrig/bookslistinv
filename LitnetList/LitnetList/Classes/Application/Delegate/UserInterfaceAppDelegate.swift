//
//  UserInterfaceAppDelegate.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class UserInterfaceAppDelegate: ApplicationDelegate {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    
    setupAppearance()
    
    application.initializeRootViewController(TabBarAssembly.createModule())
  }
  
  private func setupAppearance() {
    
    UINavigationBar.appearance().tintColor = .black
    UINavigationBar.appearance().barTintColor = .white
    
    UINavigationBar.appearance().clipsToBounds = false
    UINavigationBar.appearance().isTranslucent = false
    
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().setBackgroundImage(UIImage(),
                                                    for: UIBarPosition.any,
                                                    barMetrics: UIBarMetrics.default)
    
    UINavigationBar.appearance().titleTextAttributes = [
      .foregroundColor: UIColor.black,
      .font: UIFont.systemFont(ofSize: 17, weight: .regular)]
  }
}
