//
//  ViewController.swift
//  Todoey
//
//  Created by Temitope Fasuba on 2018-12-18.
//  Copyright © 2018 TEMIf. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["find mike", "buy eggos", "destroy demo"]
    
    let `default` = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let  items = `default`.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
    }

    //MARK - TABLEVIEW DATASOURCE METHODS
    
    override func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
      return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - TABLEVIEW DELEGATE METHOD
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
    
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
    
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else {

        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    tableView.deselectRow(at: indexPath, animated: true)
   
    
    }
        
    
    //MARK - ADD NEW ITEMS
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happens next
            self.itemArray.append(textField.text!)
            
            self.default.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

