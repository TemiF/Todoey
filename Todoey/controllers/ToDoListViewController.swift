//
//  ViewController.swift
//  Todoey
//
//  Created by Temitope Fasuba on 2018-12-18.
//  Copyright © 2018 TEMIf. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "find mike"
        itemArray.append(newItem)
       
        let newItem2 = Item()
        newItem2.title = "buy eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "destroy demos"
        itemArray.append(newItem3)
        
       // if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
        //itemArray = items
   // }
    
    }

    //MARK - TABLEVIEW DATASOURCE METHODS
    
    override func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
      return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
        
    }
    
    //MARK - TABLEVIEW DELEGATE METHOD
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
    
    if itemArray[indexPath.row].done == false {
        itemArray[indexPath.row].done = true
    } else {
        itemArray[indexPath.row].done = false
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
   
    
    }
        
    
    //MARK - ADD NEW ITEMS
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what happens next
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
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

