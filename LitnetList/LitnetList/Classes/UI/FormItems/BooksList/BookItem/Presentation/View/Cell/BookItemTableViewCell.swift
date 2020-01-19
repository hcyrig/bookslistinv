//
//  BookItemTableViewCell.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/17/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

final class BookItemTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var view: BookItemView!
}

// MARK: - SizeCalculatable -
extension BookItemTableViewCell: SizeCalculatable { }

// MARK: - ViewModelBindable -
extension BookItemTableViewCell: ViewModelBindable {
  
  typealias ViewModel = BookItemComponent.ViewModel
  
  func bind(viewModel: ViewModel) {
    
    view.bind(viewModel: viewModel)
  }
}

// MARK: - ViewModelComponentBindable -
extension BookItemTableViewCell: FormItemViewModelBindable {
  
  func bind<ComponentViewModel>(itemViewModel: ComponentViewModel) {
    guard let viewModel = itemViewModel as? BookItemComponent.ViewModel else {
      return
    }
    view.bind(viewModel: viewModel)
  }
}
