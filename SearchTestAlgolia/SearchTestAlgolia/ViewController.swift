//
//  ViewController.swift
//  SearchTestAlgolia
//
//  Created by Kathryn Whelan on 3/10/21.
//

import UIKit
import InstantSearch
typealias BestBuyHitsViewController = HitsTableViewController<BestBuyTableViewCellConfigurator>

class ViewController: UIViewController {
    

  let searcher = SingleIndexSearcher(appID: "",
                                       apiKey: "",
                                       indexName: "collection_search")
    
  lazy var searchController: UISearchController = .init(searchResultsController: nil)
  lazy var searchConnector: SingleIndexSearchConnector<BestBuyItem> = .init(searcher: searcher,
                                                                            searchController: searchController,
                                                                            hitsController: hitsViewController)
  let hitsViewController: BestBuyHitsViewController = .init()
    
    let listOfCollections: [BestBuyItem] = []
 
  override func viewDidLoad() {
    super.viewDidLoad()
    

    
    searchConnector.connect()
    searcher.search()
//    tableView.delegate = self
//    tableView.dataSource = self
  //  searchController.delegate = self
    
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
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfCollections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collection = listOfCollections[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel!.text = collection.collectionName
        return cell
    }


}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row Selected")
    }
}

extension ViewController : UISearchControllerDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("You Pressed the row")
    }
}


