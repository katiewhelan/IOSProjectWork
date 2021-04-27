//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Kathryn Whelan on 2/19/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var listResults : Results<ListType>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

     loadListType()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listResults?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = listResults?[indexPath.row].name ?? "No lists added yet"
        print(cell.textLabel!.text!)
        return cell
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newListType = ListType()
            newListType.name = textField.text!
 
            self.saveList(listType: newListType)
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add A New Category"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Data Methods (save, delete, load)
    func saveList(listType: ListType){
        do{
            try realm.write{
                realm.add(listType)
        }
            
        } catch {
            print("error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let listToDelete = self.listResults?[indexPath.row]{
            do{
                try self.realm.write {
                    self.realm.delete(listToDelete)
                    print("delete try")
                }
            } catch {
                print("error deleting List \(error)")
            }
        }
    }
    
    func loadListType (){
        listResults = realm.objects(ListType.self)
        tableView.reloadData()
    }
    
//MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "GoToItems", sender: self) 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            print("what is here \(listResults?[indexPath.row])")
            destinationVC.selectedListType = listResults?[indexPath.row]
        }
    }
}
