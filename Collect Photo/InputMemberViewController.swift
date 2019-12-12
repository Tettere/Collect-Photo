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
    func GetMember()
}

class InputMemberViewController: UIViewController,UITextFieldDelegate {
    
    
    
    
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
         delegate?.GetMember()
         self.navigationController?.popViewController(animated: true)
 
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         TextField.resignFirstResponder()
         return true
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
