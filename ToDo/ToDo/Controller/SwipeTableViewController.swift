//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Kathryn Whelan on 2/20/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.updateModel(at: indexPath)
        }
    
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        deleteAction.hidesWhenSelected = true

        return [deleteAction]
    }
    //MARK: - TableView DataSourceMethods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.withIdentifier, for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        print("cell for row at")
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        print("cell options")
        return options
    }
    
    func updateModel(at indexPath: IndexPath){
        //overrid this to delete
        let alert = UIAlertController(title: "Delete List", message: "", preferredStyle: .alert)
              let actionYes = UIAlertAction(title: "Yes", style: .default) { (action) in
                   print("Update model")
               }

               let actionNo = UIAlertAction(title: "No", style: .cancel) { (action) in
                   //hide the trash image if user says no
               }
       
               alert.addAction(actionYes)
               alert.addAction(actionNo)
               self.present(alert, animated: true, completion: nil)
    }
    
}
