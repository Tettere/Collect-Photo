//
//  MemberListViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/11.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetMemberprotocol{
    
    @IBOutlet weak var ColorLabel: UILabel!
    
    var itemArray = [MemberData]()
    
    var members:String = ""
    var membersLabel = UILabel()
    var colorNumber:Int = 0
    var colorLabel = UILabel()
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableview.delegate = self
        tableview.dataSource = self
      /*
        let userDefaults = UserDefaults.standard
              if let storedMemberList = userDefaults.array(forKey: "itemArray") as? [Data] {
                itemArray.append(storedMemberList)
              }
 */
        
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let NextVC = segue.destination as? InputMemberViewController {
           NextVC.delegate = self
       }

    }
 
    func sendText1(text1: String) {
            members = text1
    }
    
    func sendColor(color: Int){
            colorNumber = color
    }
  /////ここまで
    
    func GetMember(){
        let name = members
        let colorNum = colorNumber
        let memberdata = MemberData()
               
        memberdata.Member = name
        memberdata.Color = colorNum
        
        
        self.itemArray.append(memberdata)
        self.members.removeAll()
        self.tableview.reloadData()
        
    /*
         //UserDefaultsに保存
        let userDefaults = UserDefaults.standard
            userDefaults.set(self.itemArray, forKey: "itemArray")
            userDefaults.synchronize()
 */
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
       
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = itemArray[indexPath.row].Member

        membersLabel = cell.contentView.viewWithTag(4) as! UILabel
        membersLabel.text = item
        
        colorLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        switch itemArray[indexPath.row].Color {
        case 1:
            colorLabel.backgroundColor = .red
        case 2:
            colorLabel.backgroundColor = .purple
        case 3:
            colorLabel.backgroundColor = .systemTeal
        case 4:
            colorLabel.backgroundColor = .green
        case 5:
            colorLabel.backgroundColor = .yellow
        case 6:
            colorLabel.backgroundColor = .black
        default:
            colorLabel.backgroundColor = .white
        }
        
            return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
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
