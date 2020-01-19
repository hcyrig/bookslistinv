//
//  ReaderAssembly.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class ReaderAssembly: BaseAssembly<ReaderViewController> {
  
  override class func createModule(_ context: Context? = nil) -> ReaderViewController {
    
    let view = Storyboards.reader.controller as! ReaderViewController
    let router = Router(view: view)
    let presenter = ReaderPresenterImplementation(router: router, view: view)
    
    let backendService = BookListBackendServiceImplementation()
    
    let interactor = ReaderInteractorImplementation(presenter: presenter, context: context as? ReaderContext, backendService: backendService)
    
    view.interactor = interactor
    
    return view
  }
}
