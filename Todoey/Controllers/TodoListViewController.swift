//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appendItem(item: "Find Mike")
        appendItem(item: "Buy Eggs")
        appendItem(item: "Get Milk")
        
//        if let items = defaults.array(forKey: "TodoArray") as? [String] {
//            itemArray = items
//        }
    }
    
    func appendItem(item: String) {
        let newItem = Item()
        newItem.title = item
        itemArray.append(newItem)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            if let text = textField.text,
                textField.text != "" {
                self.appendItem(item: text)
                //self.itemArray.append(text)
                self.defaults.set(self.itemArray, forKey: "TodoArray")
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel!.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == false {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

