//
//  SelectMemberViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/17.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit
import RealmSwift

class SelectMemberViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var memberArray:Results<MemberData>!
    
    //メンバー変数
    var members:String = ""
    var membersLabel = UILabel()
          
       //色変数
    var colorNumber:Int = 0
    var colorLabel = UILabel()
    
   
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
        
        do{
            let realm = try Realm()
            memberArray = realm.objects(MemberData.self)
            }catch{
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return memberArray.count
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
                  let item = memberArray[indexPath.row].Member
                  
                  colorLabel = cell.contentView.viewWithTag(7) as! UILabel
                  
                  membersLabel = cell.contentView.viewWithTag(8) as! UILabel
                  membersLabel.text = item
                  
                  switch memberArray[indexPath.row].Color {
                      
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
