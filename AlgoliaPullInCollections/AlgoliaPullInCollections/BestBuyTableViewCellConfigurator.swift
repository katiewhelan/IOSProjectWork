//
//  BestBuyTableViewCellConfigurator.swift
//  AlgoliaPullInCollections
//
//  Created by Kathryn Whelan on 3/11/21.
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
    cell.textLabel?.text = model.collectionName
    //cell.textLabel?.text = model.name
  }

    

}
