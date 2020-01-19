//
//  SizeCalculatable.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol SizeCalculatable: class {
    
    static func estimatedHeight() -> CGFloat
    static func estimatedSize(from containerSize: CGSize) -> CGSize
}

extension SizeCalculatable {
    
    static func estimatedHeight() -> CGFloat { return UITableView.automaticDimension }
    static func estimatedSize(from containerSize: CGSize) -> CGSize { return .zero }
}
