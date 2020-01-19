//
//  BookListInteractor.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit
import PromiseKit

final class BookListContext: Context {
  
  let model: BookListScreenModel
  
  init(model: BookListScreenModel) {
    self.model = model
  }
}

final class BookListScreenModel {
  
  var booksType: LibType
  
  var books: [TransferBookModel]?
  
  func booksByType(type: LibType) -> [TransferBookModel]? {
    return books?.filter( { $0.lib_info.infoType == type } )
  }
  
  init(booksType: LibType) {
    
    self.booksType = booksType
  }
}

protocol BookListInteractor: FormInteractor { }

class BookListInteractorImplementation: BaseInteractor, BookListInteractor {
  
  enum SelfError: Error { case deallocated }
  
  private enum Constants {
    enum Strings {
      enum Screen { static let title = "Books" }
    }
  }
  
  var formContext: FormContext!
  var formPresenter: FormPresenter!
  
  private var context: BookListContext!
  private var presenter: BookListPresenter!
  private var backendService: BookListBackendService!
  
  init(presenter: BookListPresenter,
       context: BookListContext,
       backendService: BookListBackendService) {
    
    super.init()
    
    self.context = context
    self.presenter = presenter
    self.formPresenter = presenter
    self.backendService = backendService
    
    formContext = .init(
      form: .init(formDescription: formDescription)
    )
  }
  
  private var formDescription: ScreenDescriptionInfoModel {
    
    return .init(titleText: Constants.Strings.Screen.title, descriptionText: "")
  }
  
  func fetchForm() {
    
    _ = backendService.getBookList()
      
      .done(and: presenter, on: .main) { [weak self] books in
        
        guard let strongSelf = self else {
          throw SelfError.deallocated
        }
        strongSelf.context.model.books = books }
      
      .ensure { [weak self] in self?.fillForm() }
      
      .recover(on: .main) { [weak self] _ in
        
        self?.context.model.books = [] }
  }
  
  // MARK: - Fill Form -
  private func fillForm() {
    
    guard let books = context.model.booksByType(type: context.model.booksType),
      !books.isEmpty else { return }
    
    var formItems = [FormItemBuilder]()
    
    formItems.append(contentsOf: booksBuilders(with: books))
    
    presenter.presentForm(formItems)
  }
  
  private func booksBuilders(with books: [TransferBookModel]) -> [FormItemBuilder] {
    
    return books.compactMap({ book -> BookItemComponent.Model in
      
      return .init(title: .init(text: book.book.title),
                   author: .init(text: book.book.author_name),
                   genre: .init(text: book.book.type), handle: { [weak self] in
                    
                    self?.presenter.presentBook(book: book)
      })
      
    }).compactMap { BookItemComponent.Builder(model: $0) }
  }
  
  func fetchLeftNavigationItem() { }
  func fetchRightNavigationElement() { }
}

// MARK: - ContextSupportable -
extension BookListInteractorImplementation: ContextSupportable {
  
  var internalContext: Context? { return context }
}
