//
//  TabBarInteractor.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol TabBarInteractor: Interactor {
  
  func fetchTabBarItems()
}

class TabBarInteractorImplementation: BaseInteractor {
  
  private let presenter: TabBarPresenter
  private var context: Context?
  
  init(presenter: TabBarPresenter,
       context: Context?) {
    
    self.presenter = presenter
    self.context = context
  }
}

extension TabBarInteractorImplementation: TabBarInteractor {
  
  func fetchTabBarItems() {
    
    fetchReadTabBarItem()
    fetchArchiveTabBarItem()
    fetchMarkTabBarItem()
  }
  
  func fetchReadTabBarItem() {
    
    let read = TabBarModel(title: LibType.read.title)
    presenter.presentReadTabBarItem(read, context: context)
  }
  
  func fetchArchiveTabBarItem() {
    
    let archive = TabBarModel(title: LibType.archive.title)
    presenter.presentArchiveTabBarItem(archive, context: context)
  }
  
  func fetchMarkTabBarItem() {
    
    let mark = TabBarModel(title: LibType.mark.title)
    presenter.presentMarkTabBarItem(mark, context: context)
  }
}
