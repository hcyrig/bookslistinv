//
//  Form.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

struct FormModel {
  
  var formDescription: ScreenDescriptionInfoModel
  
  init(formDescription: ScreenDescriptionInfoModel = .init()) {
    
    self.formDescription = formDescription
  }
}

protocol FormItemModel { }

protocol FormItemViewModel {
    var cell: UITableViewCell.Type { get }
}

protocol FormItemViewModelBindable {
    func bind<ViewModel>(itemViewModel: ViewModel)
}

protocol ViewModelBindable {
    
    associatedtype ViewModel
    func bind(viewModel: ViewModel)
}

protocol FormItemBuilder {
  var item: FormItemModel { get }
  var itemViewModel: FormItemViewModel { get }
}

protocol Form: class {
  
  var items: [FormItemViewModel] { get }
  
  func fireItems(for tableView: UITableView)
  
  func registerItems(for tableView: UITableView)
  func itemCell(for index: Int, in tableView: UITableView) -> UITableViewCell
  func itemCellHeight(for index: Int, in tableView: UITableView) -> CGFloat
  
  func reloadItems(for tableView: UITableView)
}

extension Form {
  
  func registerItems(for tableView: UITableView) {
    items.forEach {
      tableView.register($0.cell.nib, forCellReuseIdentifier: $0.cell.identifier)
    }
  }
  
  func itemCellHeight(for index: Int, in tableView: UITableView) -> CGFloat {
    return (items[index].cell as? SizeCalculatable.Type)?.estimatedHeight() ?? 0
  }
  
  func itemCell(for index: Int, in tableView: UITableView) -> UITableViewCell {
    
    let item = items[index]
    let cell = tableView.dequeueCell(cell: item.cell)
    (cell as? FormItemViewModelBindable)?.bind(itemViewModel: item)
    return cell
  }
}

class FormImplementation: NSObject, Form {
  
  var items: [FormItemViewModel] = []
  
  init(items: [FormItemViewModel]) {
    super.init()
    
    self.items = items
  }
  
  private func connect(with tableView: UITableView) {
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func fireItems(for tableView: UITableView) {
    
    registerItems(for: tableView)
    connect(with: tableView)
    reloadItems(for: tableView)
  }
  
  func reloadItems(for tableView: UITableView) {
    
    guard tableView.delegate != nil
      && tableView.dataSource != nil else {
        return
    }
    
    tableView.reloadData()
  }
  
  deinit { items.removeAll() }
}

// MARK: - UITableViewDelegate -
extension FormImplementation: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return itemCellHeight(for: indexPath.row, in: tableView)
  }
}

// MARK: - UITableViewDataSource -
extension FormImplementation: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = itemCell(for: indexPath.row, in: tableView)
    return cell
  }
}
