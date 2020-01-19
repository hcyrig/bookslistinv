//
//  Typealias.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

typealias EmptyClosureType = () -> Void
// get value from source
typealias ValueCallback<Type> = () -> Type
// set value in source
typealias SetValueCallback<Type> = (Type) -> Void
// push value out source
typealias PushValueCallback<Type> = (@escaping SetValueCallback<Type>) -> Void
