//
//  ReaderPresenter.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol ReaderPresenter: Presenter, ErrorHandler {
  
  func presentChapters(_ models: [ReaderModel])
  func presentTitle(_ model: ReaderScreenViewModel)
}

class ReaderPresenterImplementation: BasePresenter {
  
  private weak var view: ReaderView?
  
  init(router: Router, view: ReaderView?) {
    super.init(router: router)
    self.view = view
  }
}

extension ReaderPresenterImplementation: ReaderPresenter, ViewSupportable {
  
  var internalView: View? { return view }
  
  func presentChapters(_ models: [ReaderModel]) {
    
    view?.displayChapters(models.compactMap({ ReaderViewModel($0) }))
  }
  
  func presentTitle(_ model: ReaderScreenViewModel) {
    
    view?.displayTitle(model)
  }
}
