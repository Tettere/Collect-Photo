//
//  CutListViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/14.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit
import RealmSwift

class CutListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
   // var cutArray:Results<CutData>!
    var cutArray = [String]()
    var cutArray1 = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
       
        do{
            let realm = try Realm()
            cutArray = realm.objects(CutData.self).value(forKey: "Cut") as! [String]
        }catch{
        }
        
        cutArray1 = cutArray
        
    }
        
    
    @IBAction func cutAdd(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "種類を追加", message: "生写真の型を追加しよう！", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "種類に追加", style: .default) { (action) in
        let newItem:String = String(textField.text!)
        let cutData = CutData()
        // アイテム追加処理
        cutData.Cut = newItem
        self.cutArray1.append(newItem)
        self.tableView.insertRows(at: [IndexPath(row: self.cutArray1.count - 1, section: 0)], with: UITableView.RowAnimation.fade)
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
            realm.add(cutData)
        })
        }catch{
        }
    /*
        let userDefaults = UserDefaults.standard
        userDefaults.set(self.cutArray, forKey: "cutArray")
        userDefaults.synchronize()
             
 */
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "例 ヨリ"
            textField = alertTextField
        }

        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cutArray1.count
        
    }
    
    //Cell構築
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CutCell", for: indexPath)
        let cutName:String = cutArray1[indexPath.row]
        cell.textLabel?.text = cutName
        return cell
        
    }
      
     //アイテム削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*
        cutArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        self.tableView.reloadData()
        */
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
                          // Realm内のデータを削除
            do{
                let realm = try Realm()
                let result = realm.objects(CutData.self).filter("Cut == '\(cutArray1[indexPath.row])'")
                try realm.write {
                    realm.delete(result)
                }
                cutArray1.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
                }catch{
                }
        }
       
        
    }

    

}
