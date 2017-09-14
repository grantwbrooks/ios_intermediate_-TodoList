//
//  ListTableViewController.swift
//  TodoListApp
//
//  Created by Grant Brooks on 9/14/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import UIKit
import CoreData


class ListTableViewController: UITableViewController, AddItemDelegate {

    var todos = [TodoListItem]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    @IBAction func ComposeButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddItemSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let additemvc = segue.destination as! AddItemViewController
        additemvc.delegate = self
    }
    

    
    
    override func viewDidLoad() {
//        todos = ["Do this", "Do two", "Do three"]
        super.viewDidLoad()
        fetchAllItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }
    
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        
//        cell.accessoryType = UITableViewCellAccessoryType.checkmark
        
        cell.TodoTitle.text = todos[indexPath.row].title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        cell.TodoDateLabel.text = formatter.string(for: todos[indexPath.row].date!)
        
        cell.TodoBodyLabel.text = todos[indexPath.row].body
        
        if(todos[indexPath.row].done == true) {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    func addItem(title: String, body: String, date: Date, done: Bool) {
        print(title, body, date)
        
        let newitem = TodoListItem(context: managedObjectContext)
        newitem.title = title
        newitem.body = body
        newitem.date = date as NSDate
        newitem.done = done


        
        do { try managedObjectContext.save()}
        catch { print("\(error)") }
        fetchAllItems()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.none {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        //save checkmark
            todos[indexPath.row].done = true
        } else { tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            todos[indexPath.row].done = false
        }
        do { try managedObjectContext.save()}
        catch { print("\(error)") }
    }
    
    
    
    func fetchAllItems() {
        let request:NSFetchRequest<TodoListItem> = TodoListItem.fetchRequest()
        do { todos = try managedObjectContext.fetch(request)}
        catch { print("\(error)") }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
