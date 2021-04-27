//
//  ViewController.swift
//  AlgoliaAgain
//
//  Created by Kathryn Whelan on 3/11/21.
//

import UIKit
import InstantSearch

class CollectionListViewController: UIViewController {
    let searcher: SingleIndexSearcher
    let filterState: FilterState
    let hitsInteractor: HitsInteractor<Collectzion>
    let textFieldController: TextFieldController
    let queryInputInteractor: QueryInputInteractor
    
 
    let tableView: UITableView
    let searchController: UISearchController
    private let cellIdentifier = "cellID"
    var collections: [Collectzion]
    weak var delegate: CollectionListViewControllerDelegate?
      
      let client = SearchClient(appID: "", apiKey: "")

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      //searcher = SingleIndexSearcher(client: .demo, indexName: "mobile_demo_home")
      searcher = SingleIndexSearcher(client: client, indexName: "collection_search")
      filterState = .init()
      hitsInteractor = HitsInteractor(infiniteScrolling: .on(withOffset: 10), showItemsOnEmptyQuery: true)
    collections = []
      
      searcher.indexQueryState.query.hitsPerPage = 40
      searcher.connectFilterState(filterState)
      
      hitsInteractor.connectSearcher(searcher)
      hitsInteractor.connectFilterState(filterState)
      searchController = UISearchController(searchResultsController: .none)
      textFieldController = TextFieldController(searchBar: searchController.searchBar)
      queryInputInteractor = .init()
      queryInputInteractor.connectController(textFieldController)
      queryInputInteractor.connectSearcher(searcher)
      searchController.obscuresBackgroundDuringPresentation = false
      self.tableView = UITableView()
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      definesPresentationContext = true
      navigationItem.searchController = searchController
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
      tableView.delegate = self
      tableView.dataSource = self
      hitsInteractor.onResultsUpdated.subscribe(with: self) { viewController, results in
        let collectzions = (try? results.extractHits() as [Collectzion]) ?? []
        viewController.updateCollectzions(collectzions)
      }
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
      print("Initial Load")
      super.viewDidLoad()
//      view.backgroundColor = .white
//      tableView.translatesAutoresizingMaskIntoConstraints = true
//      view.addSubview(tableView)
        
        //tableView.pin(to: view.safeAreaLayoutGuide)
     
      searcher.search()
    }
    
  }

extension CollectionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    func updateCollectzions(_ collectzions: [Collectzion]) {
     
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return collections.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collectzion = collections[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
      cell.textLabel?.text = collectzion.collectionName
      return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "Collections"
    }
    
  }

  extension CollectionListViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let collectzion = collections[indexPath.section]
      print("Demo - selected a row")
      delegate?.collectionListViewController(self, didSelect: collectzion)
    }
    
  }

  protocol CollectionListViewControllerDelegate: class {
    
    func collectionListViewController(_ collectionListViewController: CollectionListViewController, didSelect collectzion: Collectzion)
    
  }
