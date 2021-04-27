//
//  ViewController.swift
//  AlgoliaAnotherTry
//
//  Created by Kathryn Whelan on 3/11/21.
//

import UIKit
import InstantSearch
import AlgoliaSearchClient

class ViewController: UIViewController {
    var listOfCollections : [Collectzion] =  []
    let client = SearchClient(appID: "", apiKey: "")
  
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
      super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textFieldInput.delegate = self
        searchCollection(textFieldString: "")
        
    }
   


 
    func searchCollection(textFieldString : String){
        print("HERE IS THE SEARCH STRING \(textFieldString)")
//
        let index = client.index(withName: "collection_search")
//
        var query = Query(textFieldString)
            .set(\.responseFields, to: [.hits, .facets])
        query.attributesToRetrieve = ["collectionName"]
        query.hitsPerPage = 50
        index.search(query: query) { result in
          if case .success(let response) = result {
            print("Response from search: \(response.query)")
            print("RESPONSE \(response)")
           // let colect = Collectzion(collectionName: "HardCodedTestCase")
            //self.listOfCollections.append(colect)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
          }
        }
        
        
    }
    
    
  }
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ROW SELECTED")
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfCollections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colection = listOfCollections[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for : indexPath)
        
        cell.textLabel?.text = colection.collectionName
        return cell
    }
    
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("TEXT CHANGED\(textField.text)")
        searchCollection(textFieldString: textField.text!)
    }
}



