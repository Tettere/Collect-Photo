//
//  InputMemberViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/11.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

protocol GetMemberprotocol {
    func sendText1(text1: String)
    func sendColor(color: Int)
    func GetMember()
}

class InputMemberViewController: UIViewController,UITextFieldDelegate {
    
    var BtnColor:Int = 0
    
    
    @IBOutlet weak var TextField: UITextField!
    
    var delegate: GetMemberprotocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        TextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       }
   
    @IBAction func AddMember(_ sender: Any) {
     
        delegate?.sendText1(text1: TextField.text!)
        delegate?.sendColor(color: BtnColor)
        delegate?.GetMember()
        self.navigationController?.popViewController(animated: true)
 
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func Btn(_ sender: Any) {
        let n:UIButton = sender as! UIButton
        
        switch n.tag {
        case 1:
             BtnColor = 1
        case 2:
             BtnColor = 2
        case 3:
             BtnColor = 3
        case 4:
             BtnColor = 4
        case 5:
             BtnColor = 5
        case 6:
             BtnColor = 6
        default:
             BtnColor = 0
        }
        
    }
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         TextField.resignFirstResponder()
         return true
     }


}
