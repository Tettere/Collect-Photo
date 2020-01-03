//
//  inputViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/01.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//
import UIKit
import RealmSwift

protocol GetDataprotocol {
    
    func GetData()
    func sendText1(text1: String)
    func sendText2(text2: String)
    func cutText1(cutcount: Int, cut1: String)
    func cutText2(cutcount: Int, cut1: String, cut2: String)
    func cutText3(cutcount: Int, cut1: String, cut2: String, cut3: String)
    func cutText4(cutcount: Int, cut1: String, cut2: String, cut3: String, cut4: String)
    func cutText5(cutcount: Int, cut1: String, cut2: String, cut3: String, cut4: String, cut5: String)
    func cutText6(cutcount: Int, cut1: String, cut2: String, cut3: String, cut4: String, cut5: String, cut6: String)
    
}

class inputViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    //日付
    @IBOutlet weak var datefield: UITextField!
    //ファイル名
    @IBOutlet weak var TextField: UITextField!
    
    //種類
    @IBOutlet weak var Cut1Field: UITextField!
    @IBOutlet weak var Cut2Field: UITextField!
    @IBOutlet weak var Cut3Field: UITextField!
    @IBOutlet weak var Cut4Field: UITextField!
    @IBOutlet weak var Cut5Field: UITextField!
    @IBOutlet weak var Cut6Field: UITextField!
    
    //種類用picker
    var cutpickerView: UIPickerView = UIPickerView()
    //日付用picker
    var datePicker: UIDatePicker = UIDatePicker()
    //種類取得用
    var cutArray = [String]()
    //textFieldのtag管理
    var cutTextFieldTag = Int()
    
    var delegate: GetDataprotocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        do{
            let realm = try Realm()
            cutArray = realm.objects(CutData.self).value(forKey: "Cut") as! [String]
        }catch{
        }
        //種類の入力を強制させないようにする
        cutArray.insert("", at: 0)
        
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current

        cutpickerView.delegate = self
        cutpickerView.dataSource = self
        TextField.delegate = self
        datefield.delegate = self
        
        //cutpickerView.showsSelectionIndicator = true
        //日付Picker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        //種類Picker
        let cuttoolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let cutcancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(Cancel))
        let cutspacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cutdonelItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        cuttoolbar.setItems([cutcancelItem,cutspacelItem,cutdonelItem], animated: true)

        // インプットビュー設定(紐づいているUITextfieldへ代入)
        datefield.inputView = datePicker
        datefield.inputAccessoryView = toolbar
        datefield.tag = 1
       
        Cut1Field.inputView = cutpickerView
        Cut1Field.inputAccessoryView = cuttoolbar
        Cut1Field.tag = 2
        
        Cut2Field.inputView = cutpickerView
        Cut2Field.inputAccessoryView = cuttoolbar
        Cut2Field.tag = 3
        
        Cut3Field.inputView = cutpickerView
        Cut3Field.inputAccessoryView = cuttoolbar
        Cut3Field.tag = 4
        
        Cut4Field.inputView = cutpickerView
        Cut4Field.inputAccessoryView = cuttoolbar
        Cut4Field.tag = 5
    
        Cut5Field.inputView = cutpickerView
        Cut5Field.inputAccessoryView = cuttoolbar
        Cut5Field.tag = 6
        
        Cut6Field.inputView = cutpickerView
        Cut6Field.inputAccessoryView = cuttoolbar
        Cut6Field.tag = 7
        
        Cut1Field.delegate = self
        Cut2Field.delegate = self
        Cut3Field.delegate = self
        Cut4Field.delegate = self
        Cut5Field.delegate = self
        Cut6Field.delegate = self
        
        
        
    }
//TextFieldに触れるとtagを取得
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cutTextFieldTag = textField.tag
    }
    /*
    @objc func cancel(){
        
    }*/
    
    @objc func done() {
        switch cutTextFieldTag {
        case 1:
            self.datefield.endEditing(true)
            // 日付のフォーマット
            let formatter = DateFormatter()
            //出力の仕方
            formatter.dateFormat = "MM月dd日"
            //formatter.dateFormat = "YYYYMMdd"
            //(from: datePicker.date))を指定してあげることで
            //datePickerで指定した日付が表示される
            datefield.text = "\(formatter.string(from: datePicker.date))"
        case 2:
            self.Cut1Field.endEditing(true)
        case 3:
            self.Cut2Field.endEditing(true)
        case 4:
            self.Cut3Field.endEditing(true)
        case 5:
            self.Cut4Field.endEditing(true)
        case 6:
            self.Cut5Field.endEditing(true)
        case 7:
            self.Cut6Field.endEditing(true)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
//完了ボタンを押すと元の画面に戻る（セルが構築される）
    @IBAction func OKButton(_ sender: Any) {
        var n:Int = 0
        if(Cut1Field.text != ""){
            n = n + 1
        }
        if(Cut2Field.text != ""){
            n = n + 1
        }
        if(Cut3Field.text != ""){
            n = n + 1
        }
        if(Cut4Field.text != ""){
            n = n + 1
        }
        if(Cut5Field.text != ""){
            n = n + 1
        }
        if(Cut6Field.text != ""){
            n = n + 1
        }
        
        switch n {
        case 1:
            delegate?.cutText1(cutcount: n, cut1: Cut1Field.text!)
        case 2:
            delegate?.cutText2(cutcount: n, cut1: Cut1Field.text!, cut2: Cut2Field.text!)
        case 3:
            delegate?.cutText3(cutcount: n, cut1: Cut1Field.text!, cut2: Cut2Field.text!, cut3: Cut3Field.text!)
        case 4:
            delegate?.cutText4(cutcount: n, cut1: Cut1Field.text!, cut2: Cut2Field.text!, cut3: Cut3Field.text!, cut4: Cut4Field.text!)
        case 5:
            delegate?.cutText5(cutcount: n, cut1: Cut1Field.text!, cut2: Cut2Field.text!, cut3: Cut3Field.text!, cut4: Cut4Field.text!, cut5: Cut5Field.text!)
        case 6:
            delegate?.cutText6(cutcount: n, cut1: Cut1Field.text!, cut2: Cut2Field.text!, cut3: Cut3Field.text!, cut4: Cut4Field.text!, cut5: Cut5Field.text!, cut6: Cut6Field.text!)
        default: break
        }
        
        delegate?.sendText1(text1: TextField.text!)
        delegate?.sendText2(text2: datefield.text!)
        delegate?.GetData()
        
      //  print(n)
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cutArray.count
       }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cutArray[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch cutTextFieldTag {
        case 2:
            self.Cut1Field.text = cutArray[row]
        
        case 3:
            self.Cut2Field.text = cutArray[row]
        
        case 4:
            self.Cut3Field.text = cutArray[row]
            
        case 5:
            self.Cut4Field.text = cutArray[row]
            
        case 6:
            self.Cut5Field.text = cutArray[row]
            
        case 7:
            self.Cut6Field.text = cutArray[row]
        
        default: break
        }
    }

}
