//
//  TabBarViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol TabBarView: View {
  
  func displayTabBarItem(_ viewModel: TabBarViewModel)
  func selectTabAt(_ index: Int)
}

class TabBarController: UITabBarController {
  
  var interactor: TabBarInteractor?
  
  private var viewModels: [TabBarViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    interactor?.fetchTabBarItems()
    
    setupDelegates()
  }
  
  private func setupDelegates() {
    delegate = self
  }
  
  private func shouldSelectViewController(_ viewController: UIViewController) -> Bool {
    
    guard let index = viewControllers?.firstIndex(of: viewController) else {
      return false
    }
    
    return viewModels[index].actionHandler?() ?? true
  }
}

extension TabBarController: TabBarView {
  
  func displayTabBarItem(_ viewModel: TabBarViewModel) {
    
    viewModels.append(viewModel)
    
    if let viewController = viewModel.viewController {
      
      if viewControllers == nil {
        viewControllers = [viewController]
      } else {
        viewControllers?.append(viewController)
      }
    }
  }
  
  func selectTabAt(_ index: Int) {
    selectedIndex = index
  }
}

// MARK: - UITabBarControllerDelegate -
extension TabBarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController,
                        shouldSelect viewController: UIViewController) -> Bool {
    return shouldSelectViewController(viewController)
  }
}
