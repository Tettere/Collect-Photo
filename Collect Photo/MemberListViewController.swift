//
//  MemberListViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/11.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetMemberprotocol {
    
    var itemArray: [String] = []
    
    var members:String = ""
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        
        
    }
    
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   if let NextVC = segue.destination as? InputMemberViewController {
      //      NextVC.delegate = self
      //  }
  //  }
    
    func sendText1(text1: String) {
            members = text1
    }
    
    func GetMember(){
        let name = members
        self.itemArray.append(name)
        self.members.removeAll()
        self.tableview.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            itemArray.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
            let item = itemArray[indexPath.row]
            cell.textLabel?.text = item
        
            return cell
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
