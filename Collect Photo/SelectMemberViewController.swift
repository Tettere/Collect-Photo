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
    
    var number = Int()
    //チェックマークが付いたセルの行番号を格納する配列
    var rowListArray = [Int]()
    
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
        tableview.allowsMultipleSelectionDuringEditing = true
        
        
        //「メンバーリスト」からcell情報を取得
        do{
            let realm = try Realm()
            memberArray = realm.objects(MemberData.self)
            }catch{
        }
        /*
        self.tableview.reloadData()
 */
        
        /*
        //保存しているリストの読み込み処理
        let userDefaults = UserDefaults.standard
        if let storedData:IndexPath = userDefaults.object(forKey: "rowListArray") as? IndexPath {
            print(storedData)
            storedData.forEach {_ in
                tableview.selectRow(at:storedData, animated: false, scrollPosition: .none)
            }
        }
         */
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        tableview.reloadData()
        
    }*/
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memberArray.count
        
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
        let item = memberArray[indexPath.row].Member
                  
        colorLabel = cell.contentView.viewWithTag(7) as! UILabel
                  
        membersLabel = cell.contentView.viewWithTag(8) as! UILabel
        membersLabel.text = item
        
        
        //セルの選択時の背景色を消す
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
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
        //セルの選択状況の判定
        if (rowListArray.contains(indexPath.row)){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        
       //UDに何か保存されている時だけ呼ばれる。つまり最初は絶対に呼ばれない。
        /*
        if UserDefaults.standard.object(forKey: "rowListArray\(number)") != nil{
 */
         if UserDefaults.standard.object(forKey: "rowListArray") != nil{
            //前回チェックマークをつけたセルの行番号をUDから取得
            //let storedData = UserDefaults.standard.object(forKey: "rowListArray\(number)")! as! [Int]
            let storedData = UserDefaults.standard.object(forKey: "rowListArray")! as! [Int]
            //print(storedData)
            //cellを生成すると同時にチェックマークを付け直す（本来（前回）は付いていたから）
            for storedData in storedData {
                
                if indexPath.row == storedData {
                    //チェック入れる
                    cell.accessoryType = .checkmark
                    //チェックが入ったのでその行番号を配列に格納
                    self.rowListArray.append(indexPath.row)
                    //print(storedData)
                }
            }
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        //選択したセルにチェックマークが無い場合はチェックマークをつける
        if(cell?.accessoryType == UITableViewCell.AccessoryType.none){
            cell?.accessoryType = .checkmark
            self.rowListArray.append(indexPath.row)
            
        }else{
            
        //選択したセルにチェックマークがある場合はチェックマークを外す
            cell?.accessoryType = .none
        //チェックマークを外したので配列から行番号を除外
            let  listNumber = rowListArray.filter ({ (n:Int) -> Bool in
            if n != indexPath.row{
                return true
            }else{
                return false
            }})
            
        //行番号の配列を上書き
        rowListArray = listNumber
            
        }
        /*
        //選択状態を解除
        tableview.deselectRow(at: indexPath, animated: true)
 */
        
    }
    //完了ボタンが押されたら
    @IBAction func Finish(_ sender: Any) {
        
        //チェックマークが付いているセルの行番号を配列にまとめてUDに保存。そして前画面に戻る。
        let userDefaults = UserDefaults.standard
      //let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: rowListArray, requiringSecureCoding: false)
        /*
        userDefaults.set(rowListArray, forKey: "rowListArray\(number)")
        print(number)
 */
        userDefaults.set(rowListArray, forKey: "rowListArray")
        userDefaults.synchronize()
      //print(rowListArray)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    /*realmに保存してるメンバーリストのうちrowListArrayに格納されている行番号のcellだけ持ってこればいいかも*/
    
}

