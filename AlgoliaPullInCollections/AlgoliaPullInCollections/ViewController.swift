//
//  ViewController.swift
//  AlgoliaPullInCollections
//
//  Created by Kathryn Whelan on 3/11/21.
//
import UIKit
import Foundation
import InstantSearch

typealias BestBuyHitsViewController = HitsTableViewController<BestBuyTableViewCellConfigurator>


class ViewController: UIViewController, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("UPDATE SEARCH RESULTS\(hitsViewController)")
    }
    
      
    let searcher: SingleIndexSearcher = .init(appID: "",
                                              apiKey: "",
                                              indexName: "collection_search")
  lazy var searchController: UISearchController = .init(searchResultsController: hitsViewController)
  //  let searchController = UISearchController(searchResultsController : nil)
  lazy var searchConnector: SingleIndexSearchConnector<BestBuyItem> = .init(searcher: searcher,
                                                                            searchController: searchController,
                                                                            hitsController: hitsViewController)
  let hitsViewController: BestBuyHitsViewController = .init()
  
  override func viewDidLoad() {
//    // 1
//    searchController.searchResultsUpdater = self
//    // 2
//    searchController.obscuresBackgroundDuringPresentation = false
//    // 3
//    searchController.searchBar.placeholder = "Search Candies"
//    // 4
//    navigationItem.searchController = searchController
//    // 5
//    definesPresentationContext = true
    super.viewDidLoad()
    searchConnector.connect()
    searcher.search()
    setupUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    searchController.searchBar.becomeFirstResponder()
  }
  
  func setupUI() {
    view.backgroundColor = .white
    navigationItem.searchController = searchController
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.showsSearchResultsController = true
    searchController.automaticallyShowsCancelButton = false
  }
      
}

extension BestBuyHitsViewController : UITableViewDelegate {
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("HELLO WORLD ")
    }
}
