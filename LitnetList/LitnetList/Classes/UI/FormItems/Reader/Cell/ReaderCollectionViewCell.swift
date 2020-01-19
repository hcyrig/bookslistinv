//
//  ReaderCollectionViewCell.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

final class ReaderCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private weak var textView: UITextView!
}

extension ReaderCollectionViewCell: ViewModelBindable {
  
  typealias ViewModel = ReaderViewModel
  
  func bind(viewModel: ReaderViewModel) {

    textView.text = viewModel.text.text.htmlToString
    textView.font = viewModel.text.font.type.font
  }
}
