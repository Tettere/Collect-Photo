//
//  InputMemberViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/11.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit
import RealmSwift

protocol GetMemberprotocol {
    
    func sendText1(text1: String)
    func sendColor(color: Int)
    func order(oderInt: Int)
    func GetMember()
    
    
}

class InputMemberViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var colorImage: UILabel!
    @IBOutlet weak var TextField: UITextField!
    
    var BtnColor:Int = 0
    
    var delegate: GetMemberprotocol?
    
    var i:Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TextField.delegate = self
        
    }

    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
   //完了ボタン押すとcellが構築されて戻る
    @IBAction func AddMember(_ sender: Any) {
        //毎回変数＋１になる。これによって削除されたCell関係なしに昇順でソートするからじメンバーリストの順番がおかしくなることはない
        if UserDefaults.standard.object(forKey: "order") != nil{
            let storedData = UserDefaults.standard.object(forKey: "order")! as! Int
            i = storedData
        }
        i = i + 1
        print(i)
        delegate?.sendText1(text1: TextField.text!)
        delegate?.sendColor(color: BtnColor)
        delegate?.order(oderInt: i)
        delegate?.GetMember()
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(i, forKey: "order")
        userDefaults.synchronize()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    //キャンセル押すと戻る
    @IBAction func Cancel(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    //どのボタンが押されたかによって色が確定
    @IBAction func Btn(_ sender: Any) {
        let n:UIButton = sender as! UIButton
        
        switch n.tag {
            
            case 1:
                BtnColor = 1
                colorImage.backgroundColor = .red
            case 2:
                BtnColor = 2
                colorImage.backgroundColor = .purple
            case 3:
                BtnColor = 3
                colorImage.backgroundColor = .systemTeal
            case 4:
                BtnColor = 4
                colorImage.backgroundColor = .green
            case 5:
                BtnColor = 5
                colorImage.backgroundColor = .yellow
            case 6:
                BtnColor = 6
                colorImage.backgroundColor = .black
            default:
                BtnColor = 0
                colorImage.backgroundColor = .white
            
        }
    }
    
    
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        TextField.resignFirstResponder()
        
        return true
        
    }


}
