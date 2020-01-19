//
//  BookListAssembly.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

final class BookListAssembly: BaseAssembly<FormViewController> {
  
  override class func createModule(_ context: Context? = nil) -> FormViewController {
    
    let view = Storyboards.form.controller as! FormViewController
    
    guard let context = context as? BookListContext else {
      return view
    }
    
    let presenter = BookListPresenterImplementation(
      router: Router(view: view),
      view: view)
    let backendService = BookListBackendServiceImplementation()
    
    let interactor = BookListInteractorImplementation(
      presenter: presenter,
      context: context,
      backendService: backendService)
    
    view.interactor = interactor
    
    return view
  }
}
