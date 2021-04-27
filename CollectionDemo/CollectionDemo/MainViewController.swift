//
//  ViewController.swift
//  MovieDemoFile
//
//  Created by Kathryn Whelan on 3/12/21.
//

import Foundation
import UIKit
import InstantSearch

class MainViewController: UIViewController {
  
  //typealias HitType = Movie
  
  let searchTriggeringMode: SearchTriggeringMode
  
  let searcher: SingleIndexSearcher
  
  let queryInputConnector: QueryInputConnector
  
  let hitsInteractor: HitsInteractor<Collection>

  let searchBar: UISearchBar
  let textFieldController: TextFieldController
  let hitsTableViewController: MovieHitsTableViewController<Collection>
  //let client = SearchClient(appID:"latency", apiKey: "1f6fd3a6fb973cb08419fe7d288fa4db") // Movie Test Data
   // let indexName = "mobile_demo_movies"
    
 let client = SearchClient(appID: "U50VNH0YLE", apiKey: "0881bf23079eb88456ff226846f62867") //My Data
//  let indexName = "collection_search"
   
  init(searchTriggeringMode: SearchTriggeringMode) {
    print("WHAT IS THE TRIGGERING MODE AT THIS POINT \(searchTriggeringMode)")
    print("TOP OF INTI Main Control view")
    self.searchBar = .init()
    self.searchTriggeringMode = searchTriggeringMode
    self.searcher = SingleIndexSearcher(client: client, indexName: "collection_search")
    self.textFieldController = .init(searchBar: searchBar)
    self.queryInputConnector = QueryInputConnector(searcher: searcher,
                                                   searchTriggeringMode: searchTriggeringMode,
                                                   controller: textFieldController)
    self.hitsInteractor = .init(infiniteScrolling: .off, showItemsOnEmptyQuery: true)
    self.hitsTableViewController = MovieHitsTableViewController()
    super.init(nibName: .none, bundle: .none)
    addChild(hitsTableViewController)
    hitsTableViewController.didMove(toParent: self)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
   
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("YOU ARE HERE, VIEW DID LOAD")
    configureUI()
  }
  
  private func setup() {
    print("TOP OF SetUP Main Control view")
    hitsTableViewController.tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: hitsTableViewController.cellIdentifier)
    hitsInteractor.connectSearcher(searcher)
    hitsInteractor.connectController(hitsTableViewController)
    searcher.search()
  }
  
}

private extension MainViewController {
  
  func configureUI() {
    print("Configure UI")
    view.backgroundColor = .white
    
    searchBar.searchBarStyle = .minimal
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    let stackView = UIStackView()
    stackView.spacing = .px16
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    
    stackView.addArrangedSubview(searchBar)
    stackView.addArrangedSubview(hitsTableViewController.view)
    view.addSubview(stackView)
    stackView.pin(to: view.safeAreaLayoutGuide)
  }
    
}
extension CGFloat {
  static let px16: CGFloat = 16
}


