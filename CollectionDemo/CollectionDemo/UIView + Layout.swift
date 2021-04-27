//
//  UIView + Layout.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import UIKit

extension UIView {
  
  func pin(to view: UIView, insets: UIEdgeInsets = .init()) {
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
      bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom),
      leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
      trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right),
      ])
  }
  
  func pin(to layoutGuide: UILayoutGuide, insets: UIEdgeInsets = .init()) {
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
      bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: insets.bottom),
      leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.left),
      trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: insets.right),
      ])
  }
  
}
