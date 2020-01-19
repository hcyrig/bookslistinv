//
//  UITableView+Extension.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

extension UITableView {
  
  func dequeueCell<TableViewCell: UITableViewCell>(cell type: TableViewCell.Type) -> TableViewCell {
    
    return dequeueReusableCell(withIdentifier: type.identifier) as! TableViewCell
  }
  
  func dequeueCell<TableViewCell: UITableViewCell>(cell type: TableViewCell.Type, indexPath: IndexPath) -> TableViewCell {
    
    return dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
  }
  
  func register<TableViewCell: UITableViewCell>(type: TableViewCell.Type) {
    self.register(type.nib, forCellReuseIdentifier: type.identifier)
  }
}
