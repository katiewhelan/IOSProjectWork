//
//  MovieHitsTableViewController.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import UIKit
import InstantSearch

class MovieHitsTableViewController<HitType: Codable>: UITableViewController, HitsController {
    
  let cellIdentifier = "CellID"
  
  var hitsSource: HitsInteractor<HitType>?
  
  //MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return hitsSource?.numberOfHits() ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //print("MOVIE HITS VIEW CONTROLLER CellFORROWS")
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    let hit = hitsSource?.hit(atIndex: indexPath.row)
    //print("HERE IS A HIT \(hit)")
    switch hit {
    case let movie as Collection:
      (cell as? UIView & CollectionCell).flatMap(MovieCellViewState().configure)?(movie)
    default:
      break
    }
    return cell
  }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print("ROW SELECTED !!!!!!!!")
    }
  
  //MARK: - UITableViewDelegate
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
}
