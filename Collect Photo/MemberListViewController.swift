//
//  MemberListViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/11.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit
import RealmSwift

class MemberListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetMemberprotocol{
    
    @IBOutlet weak var tableview: UITableView!
    
    //メンバーリスト
    var memberArray:Results<MemberData>!
       
    //メンバー変数
    var members:String = ""
    var membersLabel = UILabel()
       
    //色変数
    var colorNumber:Int = 0
    var colorLabel = UILabel()
    
    //order変数
    var orderNumber:Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        tableview.delegate = self
        tableview.dataSource = self
        
        
        do{
            
            let realm = try Realm()
            memberArray = realm.objects(MemberData.self).sorted(byKeyPath: "Order", ascending: true)
            print(memberArray!)
            }catch{
                
        }
      /*
        //保存しているリストの読み込み処理
        let userDefaults = UserDefaults.standard
        if let storedData = userDefaults.object(forKey: "memberArray") as? Data {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? [MemberData]{
                
                memberArray.append(contentsOf: unarchivedData)
                
            }
 
        }*/
        
        
    }
    
    // 画面が表示される直前にtableViewを更新
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let NextVC = segue.destination as? InputMemberViewController {
            
            NextVC.delegate = self
            
       }
        
    }
 
    //メンバーの名前受け取り
    func sendText1(text1: String) {
        
        members = text1
        
    }
    //グループ分け用の色受け取り
    func sendColor(color: Int){
        
        colorNumber = color
        
    }
    //何番目か
    func order(oderInt: Int){
        
        orderNumber = oderInt
        
    }
    //データの受け取り＆保存
    func GetMember(){
        
        let name = members
        let colorNum = colorNumber
        let orderNum = orderNumber
        let memberdata = MemberData()
        
               
        memberdata.Member = name
        memberdata.Color = colorNum
        memberdata.Order = orderNum
        
       // self.memberArray.append(memberdata)
        self.members.removeAll()
        self.tableview.reloadData()
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
            realm.add(memberdata)
        })
        }catch{
        }
        
    /*
        //UserDefaultsに保存
        let userDefaults = UserDefaults.standard
        let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: memberArray, requiringSecureCoding: false)
        userDefaults.set(archivedData, forKey: "memberArray")
        userDefaults.synchronize()*/
        
    }
    
    //メンバー(cell)の数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memberArray.count
        
    }
    
       
    
    //cellの構築
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = memberArray[indexPath.row].Member
        
        colorLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        membersLabel = cell.contentView.viewWithTag(4) as! UILabel
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

    //cellの削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       /*
        memberArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        //消したら再度保存
        let userDefaults = UserDefaults.standard
        let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: memberArray, requiringSecureCoding: false)
        userDefaults.set(archivedData, forKey: "memberArray")
        userDefaults.synchronize()*/
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
                   // Realm内のデータを削除
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.memberArray[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
                }catch{
                }
            
            }
        print(memberArray!)
        
    }
    
}
