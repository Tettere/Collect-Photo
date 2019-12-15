//
//  inputViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/01.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//
import UIKit

protocol GetDataprotocol {
    func GetData()
    func sendText1(text1: String)
    func sendText2(text2: String)
}

class inputViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var datefield: UITextField!
  
    @IBOutlet weak var TextField: UITextField!
    //UIDatePickerを定義するための変数
    var datePicker: UIDatePicker = UIDatePicker()
    
    var delegate: GetDataprotocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        datefield.inputView = datePicker

        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)

        // インプットビュー設定(紐づいているUITextfieldへ代入)
        datefield.inputView = datePicker
        datefield.inputAccessoryView = toolbar
        
        TextField.delegate = self
        datefield.delegate = self
    }
    
    
    @objc func done() {
        datefield.endEditing(true)
        // 日付のフォーマット
        let formatter = DateFormatter()
        //出力の仕方
        formatter.dateFormat = "MM月dd日"
        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        datefield.text = "\(formatter.string(from: datePicker.date))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//完了ボタンを押すと元の画面に戻る（セルが構築される）
    @IBAction func OKButton(_ sender: Any) {
        delegate?.sendText1(text1: TextField.text!)
        delegate?.sendText2(text2: datefield.text!)
        delegate?.GetData()
        
    self.navigationController?.popToRootViewController(animated: true)
    }
    
//Cancelボタンを押すと前の画面に戻るだけ。セルは構築されない
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
//キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TextField.resignFirstResponder()
        return true
    }
    
   

}
