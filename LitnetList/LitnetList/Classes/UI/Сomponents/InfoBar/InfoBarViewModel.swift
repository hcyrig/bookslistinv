//
//  InfoAlertViewModel.swift
//  LitnetList
//
//  Created by Kostiantyn Girych on 1/14/20.
//  Copyright © 2020 Kostiantyn Girych. All rights reserved.
//

import UIKit

protocol InfoBarContent {
  func getAttributedText() -> NSAttributedString
}

struct InfoBarDescriptionList: InfoBarContent {
  
  private let infoBarContents: [InfoBarContent]
  
  init(infoBarContents: [InfoBarContent]) {
    self.infoBarContents = infoBarContents
  }
  
  // MARK: InfoBarContent
  
  func getAttributedText() -> NSAttributedString {
    
    let errorDescriptionMutableAttributedString = NSMutableAttributedString()
    
    for (index, infoBarContent) in infoBarContents.enumerated() {
      
      let infoBarContentAttributedString = infoBarContent.getAttributedText()
      errorDescriptionMutableAttributedString.append(infoBarContentAttributedString)
      if index != infoBarContents.count - 1 {
        errorDescriptionMutableAttributedString.append(NSAttributedString(string: "\n"))
      }
    }
    
    return errorDescriptionMutableAttributedString
  }
}

struct InfoBarDescription: InfoBarContent {
  
  private enum Fonts {
    static let description = UIFont.systemFont(ofSize: 14)
  }
  
  var description: String!
  
  private var textAttributes: [NSAttributedString.Key: Any] {
    return [.font: Fonts.description]
  }
  
  // MARK: InfoBarContent
  
  func getAttributedText() -> NSAttributedString {
    return NSAttributedString(string: description, attributes: textAttributes)
  }
}

struct InfoBarError: InfoBarContent {
  
  private enum Fonts {
    static let description = UIFont.systemFont(ofSize: 14)
  }
  
  var imageName: String? = "errorExclamationMark"
  let description: String
  
  private var textAttributes: [NSAttributedString.Key: Any] {
    let textColor = UIColor.red
    return [.font: Fonts.description, .foregroundColor: textColor]
  }
  
  // MARK: InfoBarContent
  
  func getAttributedText() -> NSAttributedString {
    
    let attributedString = NSMutableAttributedString()
    
    let imageAttributedString = createImageAttributedString()
    let descripAttributedString = createDescriptionAttributedString()
    
    attributedString.append(imageAttributedString)
    attributedString.append(descripAttributedString)
    
    return attributedString
  }
  
  // MARK: Halpe Methods
  
  private func createImageAttributedString() -> NSAttributedString {
    
    guard let imageName = imageName, let image = UIImage(named: imageName) else {
      return NSAttributedString()
    }
    
    guard let textFont = textAttributes[.font] as? UIFont else {
      return NSAttributedString()
    }
    
    let imageAttachment = NSTextAttachment()
    imageAttachment.bounds = CGRect(x: 0, y: (textFont.capHeight - image.size.height).rounded() / 2,
                                    width: image.size.width, height: image.size.height)
    imageAttachment.image = image
    
    return NSAttributedString(attachment: imageAttachment)
  }
  
  private func createDescriptionAttributedString() -> NSAttributedString {
    
    let descriptionString = "\t" + description
    return NSAttributedString(string: descriptionString,
                              attributes: textAttributes)
  }
}
