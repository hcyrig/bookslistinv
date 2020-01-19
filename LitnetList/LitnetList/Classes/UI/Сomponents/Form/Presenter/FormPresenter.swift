//
//  FormPresenter.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol FormTitlePresenter {
  func presentFormTitle(_ model: ScreenDescriptionInfoModel)
}

typealias FormPresenterProtocol =
  ViewSupportable
  & ErrorHandler
  & FormTitlePresenter

protocol FormPresenter: class, Presenter, FormPresenterProtocol {
  
  var view: FormView? { get }
  
  func presentForm(_ builders: [FormItemBuilder])
}

extension FormPresenter {
  
  var internalView: View? { return view }
  
  func presentFormTitle(_ model: ScreenDescriptionInfoModel) {
    view?.displayFormTitle(.init(model: model))
  }
  
  func presentForm(_ builders: [FormItemBuilder]) {
    view?.displayForm(
      builders.compactMap { $0.itemViewModel })
  }
}
