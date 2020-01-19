//
//  Router.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit
import PromiseKit

class Router {
  
  private(set) weak var view: UIViewController?
  
  init(view: UIViewController) {
    self.view = view
  }
}

// MARK: Modal presentation

extension Router {
  
  func present(_ destinationView: UIViewController,
               animated: Bool = true,
               completion: EmptyClosureType? = nil) {
    
    // https://stackoverflow.com/questions/21075540/presentviewcontrolleranimatedyes-view-will-not-appear-until-user-taps-again
    DispatchQueue.main.async {
      self.view?.present(destinationView,
                         animated: animated,
                         completion: completion)
    }
  }
  
  func dismiss() {
    view?.view.endEditing(true)
    view?.dismiss(animated: true, completion: nil)
  }
  
  func dismiss(animated: Bool, completion: EmptyClosureType? = nil) {
    view?.view.endEditing(true)
    view?.dismiss(animated: animated, completion: completion)
  }
}

// MARK: Push/Pop presentation

extension Router {
  
  func push(_ destinationView: UIViewController) {
    view?.navigationController?.pushViewController(destinationView,
                                                   animated: true)
  }
  
  func pop(to destinationView: UIViewController) {
    view?.navigationController?.popToViewController(destinationView,
                                                    animated: true)
  }
  
  func pop() {
    view?.navigationController?.popViewController(animated: true)
  }
  
  func popToRoot() {
    view?.navigationController?.popToRootViewController(animated: true)
  }
}
