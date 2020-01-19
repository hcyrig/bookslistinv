//
//  Indentifier.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol Indentifier {
  static var identifier: String { get }
}

extension Indentifier {
  static var identifier: String { return .init(describing: self) }
}

protocol NibFetcher: Indentifier {
  static var nib: UINib? { get }
}

extension NibFetcher {

  static var nib: UINib? {
    let identifier = self.identifier
    guard Bundle.main.path(forResource: identifier, ofType: "nib") != nil else {
      return nil
    }
    return UINib(nibName: identifier, bundle: nil)
  }
}

protocol NibUncoder: NibFetcher {
  
  associatedtype SelfType
  
  static var viewFromNib: SelfType? { get }
}

extension NibUncoder {
  
  static var viewFromNib: Self? {
    return nib?.instantiate(withOwner: nil,
                            options: nil).first as? Self
  }
  
  static func viewFromNib(withOwner owner: Any) -> UIView? {
    return nib?.instantiate(withOwner: owner,
                            options: nil).first as? UIView
  }
}
