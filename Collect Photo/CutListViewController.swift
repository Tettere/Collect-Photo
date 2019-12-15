//
//  CutListViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/14.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class CutListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var cutArray: [String] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let userDefaults = UserDefaults.standard
        if let storedMemberList = userDefaults.array(forKey: "cutArray") as? [String] {
            cutArray.append(contentsOf: storedMemberList)
        }
        
    }
    
    
    @IBAction func cutAdd(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "種類を追加", message: "生写真の型を追加しよう！", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "種類に追加", style: .default) { (action) in
        let newItem: String = String(textField.text!)
        // アイテム追加処理
        self.cutArray.append(newItem)
        self.tableView.reloadData()
                 
        let userDefaults = UserDefaults.standard
        userDefaults.set(self.cutArray, forKey: "cutArray")
        userDefaults.synchronize()
        }

        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "例 ヨリ"
        textField = alertTextField
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cutArray.count
        
    }
    
    //Cell構築
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CutCell", for: indexPath)
        let item = cutArray[indexPath.row]
        cell.textLabel?.text = item
        return cell
        
    }
      
     //アイテム削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        cutArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        self.tableView.reloadData()
          
        let userDefaults = UserDefaults.standard
        userDefaults.set(self.cutArray, forKey: "cutArray")
        userDefaults.synchronize()
        
    }
    

}
