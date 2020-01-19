//
//  FormInteractor.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

typealias FormInteractorProtocol =
  InteractorSupportable
  & PresenterSupportable
  & FormTitleInteractor
  & ViewLifeCycleSupportable

protocol FormTitleInteractor {
  func fetchFormTitleItem()
}

struct FormContext: Context {
  var form: FormModel
}

protocol FormInteractor: Interactor, FormInteractorProtocol {
  
  var formPresenter: FormPresenter! { get set}
  var formContext: FormContext! { get set }
  
  func fetchForm()
}

extension FormInteractor {
  
  func fetchFormTitleItem() {
    formPresenter.presentFormTitle(
      formContext.form.formDescription)
  }
  
  var internalInteractor: Interactor? { return self }
  var internalPresenter: Presenter? { return formPresenter }
}
