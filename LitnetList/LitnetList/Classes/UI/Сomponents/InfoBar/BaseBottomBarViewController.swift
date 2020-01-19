//
//  BaseBottomBarViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

class BaseBottomBarViewController: BaseViewController {
  
  typealias HideBottomBarCompletion = ((Bool) -> Void)?
  
  private enum Animations {
    static let duration: Double = 0.3
  }
  
  private enum Colors {
    enum Alpha {
      static let backgroundViewVisible: CGFloat = 0.25
      static let backgroundViewInvisible: CGFloat = 0
    }
  }
  
  private enum Layout {
    static let bottomBarViewTopCornersRadius: CGFloat = 40
  }
  
  @IBOutlet private weak var darkBackgroundView: UIView!
  @IBOutlet private weak var hideButton: UIButton!
  @IBOutlet private weak var bottomBarView: UIView!
  @IBOutlet private weak var bottomBarBottomConstraint: NSLayoutConstraint!
  
  var dismiss: EmptyClosureType?
  private var tapGesture: UITapGestureRecognizer!
  
  // MARK: Lifecycle
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    showBottomBar()
  }
  
  @IBAction func actionHideButton(_ sender: Any) {
    
    close()
  }
  
  @objc private func actionHideTapGesture(_ tapGesture: UITapGestureRecognizer) {
    
    close()
  }
  
  private func close() {
    
    hideBottomBar { [weak self] _ in
      self?.dismiss(animated: false, completion: self?.dismiss)
    }
  }
  
  private func addTapGesture() {
    
    let tapGesture = UITapGestureRecognizer(target: self,
                                            action: #selector(actionHideTapGesture(_:)))
    darkBackgroundView.addGestureRecognizer(tapGesture)
  }
  
  // MARK: Setup UI
  
  override func setupInterface() {
    super.setupInterface()
    
    addTapGesture()
    setupInitialViewState()
  }
  
  private func showBottomBar() {
    
    setBottomViewVisible(true, completion: nil)
  }
  
  private func hideBottomBar(completion: HideBottomBarCompletion) {
    
    setBottomViewVisible(false, completion: completion)
  }
  
  private func setupInitialViewState() {
    
    setupInitialBackgroundColor()
    setupInitialBottomViewPosition()
    setBottomBarRoundedTopCorners()
  }
  
  private func setupInitialBackgroundColor() {
    
    view.backgroundColor = .clear
    darkBackgroundView.backgroundColor = .black
    darkBackgroundView.alpha = 0
  }
  
  private func setupInitialBottomViewPosition() {
    
    bottomBarBottomConstraint.constant = -bottomBarView.frame.height
    view.layoutIfNeeded()
  }
  
  private func setBottomBarRoundedTopCorners() {
    
    bottomBarView.layer.cornerRadius = Layout.bottomBarViewTopCornersRadius
    bottomBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }
  
  private func setBottomViewVisible(_ visible: Bool, completion: HideBottomBarCompletion) {
    
    let backgroundViewAlpha: CGFloat = visible ? Colors.Alpha.backgroundViewVisible : Colors.Alpha.backgroundViewInvisible
    
    let constraintHeight = visible ? 0 : -bottomBarView.frame.height
    
    UIView.animate(withDuration: Animations.duration, animations: {
      self.darkBackgroundView.alpha = backgroundViewAlpha
      self.bottomBarBottomConstraint.constant = constraintHeight
      self.view.layoutIfNeeded()
      
    }, completion: completion)
  }
}
