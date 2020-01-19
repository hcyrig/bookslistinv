//
//  TabBarPresenter.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol TabBarPresenter: Presenter, ErrorHandler {
  
  func presentItem(at index: Int)
  
  func presentReadTabBarItem(_ item: TabBarItem, context: Context?)
  func presentArchiveTabBarItem(_ item: TabBarItem, context: Context?)
  func presentMarkTabBarItem(_ item: TabBarItem, context: Context?)
}

class TabBarPresenterImplementation: BasePresenter {
  
  private typealias EmptyViewController = UIViewController
  
  private weak var view: TabBarView?
  
  init(router: Router, view: TabBarView?) {
    super.init(router: router)
    
    self.view = view
  }
  
  private func displayTabBarItem(_ item: TabBarItem, controller: UIViewController) {
    
    let viewModel = TabBarViewModel(model: item, controller: controller)
    view?.displayTabBarItem(viewModel)
  }
}

extension TabBarPresenterImplementation: TabBarPresenter {
  
  func presentItem(at index: Int) {
    view?.selectTabAt(index)
  }
  
  func presentReadTabBarItem(_ item: TabBarItem, context: Context?) {
    
    displayTabBarItem(item, controller: BookListAssembly.createModule(
                        BookListContext(model: .init(booksType: .read))))
  }
  func presentArchiveTabBarItem(_ item: TabBarItem, context: Context?) {
    
    displayTabBarItem(item, controller: BookListAssembly.createModule(
                        BookListContext(model: .init(booksType: .archive))))
  }
  func presentMarkTabBarItem(_ item: TabBarItem, context: Context?) {
    
    displayTabBarItem(item, controller: BookListAssembly.createModule(
                        BookListContext(model: .init(booksType: .mark))))
  }
}

extension TabBarPresenterImplementation: ViewSupportable {
  var internalView: View? { view }
}
