//
//  BestBuyTableViewController.swift
//  SearchTestAlgolia
//
//  Created by Kathryn Whelan on 3/9/21.
//

import Foundation
import UIKit
import InstantSearch

struct BestBuyTableViewCellConfigurator: TableViewCellConfigurable {
   
  let model: BestBuyItem
  
  init(model: BestBuyItem, indexPath: IndexPath) {
    self.model = model
  }
  
  func configure(_ cell: UITableViewCell) {
    cell.textLabel?.text = model.collectionName + model.collectionName
  }

    

}
