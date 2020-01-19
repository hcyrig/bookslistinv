//
//  ReaderInteractor.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import PromiseKit

protocol ReaderInteractor: Interactor {
  
  func fetchChapters()
  func fetchTitle()
}

class ReaderInteractorImplementation: BaseInteractor {
  
  enum SelfError: Error { case deallocated }

  private let presenter: ReaderPresenter
  private var context: ReaderContext?
  private let backendService: BookListBackendService
  
  init(presenter: ReaderPresenter, context: ReaderContext? = nil,
       backendService: BookListBackendService) {
    
    self.presenter = presenter
    self.context = context
    self.backendService = backendService
  }
}

extension ReaderInteractorImplementation: ReaderInteractor, PresenterSupportable, InteractorSupportable {

  var internalPresenter: Presenter? { return presenter }
  
  var internalInteractor: Interactor? { return self }
  
  func fetchChapters() {
    
    guard let context = context else { presenter.presentChapters([]); return }
    
    _ = backendService.getChapters(bookId: context.model.bookId)
    
    .done(and: presenter, on: .main) { [weak self] chapters in
      
      guard let strongSelf = self else {
        throw SelfError.deallocated
      }
      strongSelf.context?.model.chapters = strongSelf.decodeChapters(chapters) }
    
    .ensure { [weak self] in self?.fillChapters() }
    
    .recover(on: .main) { [weak self] _ in
      
      self?.context?.model.chapters = [] }
    
    let models = context.model.chapters.compactMap({ ReaderModel(text: .init(text: $0.text ?? "")) })
    presenter.presentChapters(models)
  }
  
  func fetchTitle() {
    
    guard let context = context else { return }
    presenter.presentTitle(context.model)
  }
  
  private func decodeChapters(_ chapters: [TransferСhapterModel]) -> [TransferСhapterModel] {
    return backendService.decodeChapters(chapters: chapters)
  }
  
  private func fillChapters() {
    
    guard let context = context else { presenter.presentChapters([]); return }
    
    let models = context.model.chapters.compactMap({ ReaderModel(text: .init(text: $0.text ?? "")) })
    presenter.presentChapters(models)
  }
}
