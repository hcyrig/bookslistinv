//
//  BookListPresenter.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol BookListPresenter: FormPresenter {
  
  func presentBook(book: TransferBookModel)
}

class BookListPresenterImplementation: BasePresenter, BookListPresenter {
  
  weak var view: FormView?
  
  init(router: Router,
       view: FormView?) {
    super.init(router: router)
    
    self.view = view
  }
  
  func presentBook(book: TransferBookModel) {
    
    router.push(ReaderAssembly.createModule(
      ReaderContext(
        model: ReaderScreenViewModel(
          bookId: String(book.book.id),
          title: book.book.title,
          chapters: []))))
  }
}
