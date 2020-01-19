//
//  Context.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import Foundation

protocol Context { }

protocol ContextSupportable { var internalContext: Context? { get } }
