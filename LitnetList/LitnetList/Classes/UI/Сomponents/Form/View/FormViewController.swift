//
//  FormViewController.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol FormTitleView {
  func displayFormTitle(_ viewModel: ScreenDescriptionViewModel)
}

typealias FormViewProtocol =
  FormTitleView
  & ErrorView

protocol FormView: View, FormViewProtocol {
  
  func displayForm(_ viewModels: [FormItemViewModel])
}

class FormViewController: BaseViewController {
  
  private enum Layout {
    static let formComponentsSpacingInPt: CGFloat = 8.0
  }
  
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var stackView: UIStackView!
  
  private var form: Form!
  
  var interactor: FormInteractor?
  
  override func setupInterface() {
    super.setupInterface()
    
    setupContainerView()
    setupFormView()
    interactor?.fetchFormTitleItem()
    interactor?.fetchForm()
  }
  
  private func setupContainerView() {
    
    guard stackView == nil else { return }
    
    let stackView = UIStackView(arrangedSubviews: [])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = Layout.formComponentsSpacingInPt
    stackView.distribution = .fill
    stackView.edgesToSuperView(view)
    self.stackView = stackView
  }
  
  private func setupFormView() {
    
    if stackView != nil,
      tableView == nil {
      
      let tableView = UITableView()
      stackView.addArrangedSubview(tableView)
      self.tableView = tableView
    }
    
    tableView.tableFooterView = UIView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    interactor?.viewWillAppear()
  }
}

// MARK: - FormView -
extension FormViewController: FormView {
  
  func displayFormTitle(_ viewModel: ScreenDescriptionViewModel) {
    
    navigationItem.title = viewModel.titleText
  }
  
  func displayForm(_ viewModels: [FormItemViewModel]) {
    
    form = FormImplementation(items: viewModels)
    form.fireItems(for: tableView)
  }
}
