//
//  Promise+Catchable.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import PromiseKit

extension Thenable {
  
  typealias ErrorPresenterType = ErrorPresenter & ViewSupportable
  
  private func handleError<U>(
    with ccontext: Context? = nil,
    and errorHandler: ErrorHandler? = nil,
    in promise: PromiseKit.Promise<U>
  ) -> PromiseKit.Promise<U> {
    
    if errorHandler == nil { return promise }
    promise.catch { errorHandler?.handle(error: $0,
                                         context: ccontext) }
    return promise
  }
  
  func then<U>(
    with context: Context? = nil,
    and errorHandler: ErrorHandler? = nil,
    on: DispatchQueue? = conf.Q.map,
    flags: DispatchWorkItemFlags? = nil,
    _ body: @escaping (Self.T) throws -> U
  ) -> PromiseKit.Promise<U.T> where U: PromiseKit.Thenable {
    
    return handleError(with: context,
                       and: errorHandler,
                       in: then(on: on, flags: flags, body))
  }
  
  func done(
    with context: Context? = nil,
    and errorHandler: ErrorHandler? = nil,
    on: DispatchQueue? = conf.Q.return,
    flags: DispatchWorkItemFlags? = nil,
    _ body: @escaping (Self.T) throws -> Void
  ) -> PromiseKit.Promise<Void> {
    
    return handleError(with: context,
                       and: errorHandler,
                       in: done(on: on, flags: flags, body))
  }
}
