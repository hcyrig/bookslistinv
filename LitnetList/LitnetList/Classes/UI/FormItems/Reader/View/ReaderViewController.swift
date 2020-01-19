//
//  ReaderViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol ReaderView: View, ErrorView {
  
  func displayChapters(_ viewModels: [ReaderViewModel])
  func displayTitle(_ model: ReaderScreenViewModel)
}

class ReaderViewController: BaseViewController {
  
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var pageControl: UIPageControl!
  
  private var viewModels: [ReaderViewModel]?
  var interactor: ReaderInteractor?
  
  override func setupInterface() {
    super.setupInterface()
    
    interactor?.fetchTitle()
    
    interactor?.fetchChapters()
    
    collectionView.register(ReaderCollectionViewCell.nib, forCellWithReuseIdentifier: ReaderCollectionViewCell.identifier)
  }
}

extension ReaderViewController: ReaderView {

  func displayChapters(_ viewModels: [ReaderViewModel]) {
    self.viewModels = viewModels
    
    pageControl.numberOfPages = viewModels.count
    collectionView.reloadData()
  }
  
  func displayTitle(_ model: ReaderScreenViewModel) {
    title = model.title
  }
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension ReaderViewController: UICollectionViewDelegateFlowLayout {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    pageControl.currentPage = scrollView.flippedPage
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.frame.size
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

// MARK: - UICollectionViewDataSource -
extension ReaderViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModels?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let item = viewModels?[indexPath.row] else { return UICollectionViewCell() }
    
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ReaderCollectionViewCell.identifier, for: indexPath)
    (cell as? ReaderCollectionViewCell)?.bind(viewModel: item)
    return cell
  }
}
