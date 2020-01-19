//
//  BookItemView.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

final class BookItemView: XibReflectionView {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var authorLabel: UILabel!
  @IBOutlet private weak var genreLabel: UILabel!
  @IBOutlet private weak var stackView: UIStackView!
  
  @IBOutlet private weak var handleButton: UIButton!
  
  private var viewModel: BookItemComponent.ViewModel!
  
  @IBAction private func tapAction(sender: UIButton) {
    viewModel.handle()
  }
}

extension BookItemView: ViewModelBindable {
  
  func bind(viewModel: BookItemComponent.ViewModel) {
    
    self.viewModel = viewModel
    
    titleLabel.text = viewModel.title.text
    titleLabel.font = viewModel.title.font.type.font(.bold)
    
    authorLabel.text = viewModel.author.text
    authorLabel.font = viewModel.author.font.type.font
    
    genreLabel.text = viewModel.genre.text
    genreLabel.font = viewModel.genre.font.type.font
  }
}
