//
//  ScreenDisplayPresentation.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

// model

struct ScreenDescriptionInfoModel {
  
  var titleText: String
  var descriptionText: String
  
  init(titleText: String = "Screen title",
       descriptionText: String = "") {
    
    self.titleText = titleText
    self.descriptionText = descriptionText
  }
}

// view model
struct ScreenDescriptionViewModel {
  
  var titleText: String
  var descriptionText: String
  
  init(titleText: String = "Screen title",
       descriptionText: String = "") {
    
    self.titleText = titleText
    self.descriptionText = descriptionText
  }
  
  init(model: ScreenDescriptionInfoModel) {
    
    titleText = model.titleText
    descriptionText = model.descriptionText
  }
}

// view
protocol ScreenDescriptionLabeledView {
  
  var displayTitleLabel: UILabel! { get }
  var displayDescriptionLabel: UILabel! { get }
}

protocol ScreenDescriptionView {
  
  func displayScreenDescriptonInformation(viewModel: ScreenDescriptionViewModel)
}

extension ScreenDescriptionView where Self: UIViewController {
  
  func displayScreenDescriptonInformation(viewModel: ScreenDescriptionViewModel) {
    self.title = viewModel.titleText
  }
}

extension ScreenDescriptionView where Self: UIViewController & ScreenDescriptionLabeledView {
  
  func displayScreenDescriptonInformation(viewModel: ScreenDescriptionViewModel) {
    displayTitleLabel?.text = viewModel.titleText
    displayDescriptionLabel?.text = viewModel.descriptionText
  }
}

protocol ScreenDisplayPresentation: ScreenDescriptionLabeledView, ScreenDescriptionView { }

extension ScreenDisplayPresentation {
  
  func displayScreenDescriptonInformation(viewModel: ScreenDescriptionViewModel) {
    
    displayTitleLabel?.text = viewModel.titleText
    displayDescriptionLabel?.text = viewModel.descriptionText
  }
}

// presenter
protocol ScreenPresentPresentation {
  
  var displayModule: ScreenDescriptionView? { get }
  func presentScreenDescription(model: ScreenDescriptionInfoModel)
}

extension ScreenPresentPresentation {
  
  func presentScreenDescription(model: ScreenDescriptionInfoModel) {
    
    let viewModel = ScreenDescriptionViewModel(
      titleText: model.titleText,
      descriptionText: model.descriptionText)
    displayModule?.displayScreenDescriptonInformation(viewModel: viewModel)
  }
}

extension ScreenPresentPresentation where Self: ViewSupportable {
  var displayModule: ScreenDescriptionView? {  return internalView as? ScreenDescriptionView }
}

// interactor
protocol ScreenInformationPresentation {
  
  func fetchGeneralScreenInformation()
}
