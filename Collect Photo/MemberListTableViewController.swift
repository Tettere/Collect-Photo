//
//  MemberListTableViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/09.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class MemberListTableViewController: UITableViewController {
    
    // アイテムの型
    class Item {
        var title : String
        var color: Bool = false

        init(title: String) {
            self.title = title
        }
    }

    var itemArray: [Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let userDefaults = UserDefaults.standard
        if let storedMemberList = userDefaults.array(forKey: "itemArray") as? [Item] {
        itemArray.append(contentsOf: storedMemberList)
        }
         */
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   // override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    //    return itemArray.count
   // }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }

    
    
    @IBAction func addButton(_ sender: Any) {
        var textField = UITextField()

             let alert = UIAlertController(title: "メンバーを追加", message: "", preferredStyle: .alert)

             let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
                 // 「リストに追加」を押された時に実行される処理
                 let newItem: Item = Item(title: textField.text!)

                 // アイテム追加処理
                 self.itemArray.append(newItem)
                 self.tableView.reloadData()
               
                
           /*
                
            let userDefaults = UserDefaults.standard
                userDefaults.set(self.itemArray, forKey: "itemArray")
                userDefaults.synchronize()
                */
                
                
                
             }

             alert.addTextField { (alertTextField) in
                 alertTextField.placeholder = "名前"
                 textField = alertTextField
             }

             alert.addAction(action)
             present(alert, animated: true, completion: nil)

    }
    
    //Cell構築
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
            let item = itemArray[indexPath.row]
            cell.textLabel?.text = item.title
            return cell
    
    }
    
   //アイテム削除機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // アイテム削除処理
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        self.tableView.reloadData()

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
