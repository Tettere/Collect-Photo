//
//  ViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/11/27.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,GetDataprotocol {
   var CellArray:Results<CellData>!
   
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    //タイトル入力
    var titles:String = ""
    var titleLabel = UILabel()
    
    //日付入力
    var dates:String = ""
    var dateLabel = UILabel()
    
    //種類格納用
    var cut1Name:String = ""
    var cut2Name:String = ""
    var cut3Name:String = ""
    var cut4Name:String = ""
    var cut5Name:String = ""
    var cut6Name:String = ""
    
    var cutCouts:Int = 0
    
    //cellを格納
    var collectionlist = [CellData]()
    
    //１行あたり
    private let itemsPerRow: CGFloat = 2
  
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        do{
            let realm = try Realm()
            memberArray = realm.objects(MemberData.self).sorted(byKeyPath: "Order", ascending: true)
        }catch{
        }*/
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    
    //要素数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionlist.count
        
    }
      
    //セルを構築
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        dateLabel = cell.contentView.viewWithTag(1) as! UILabel
        dateLabel.text = collectionlist[indexPath.row].Date
        
        titleLabel = cell.contentView.viewWithTag(2) as! UILabel
        titleLabel.text = collectionlist[indexPath.row].Title
        cell.backgroundColor = .red  // セルの色
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "inputsegue"){
            
            let nextVC = segue.destination as? inputViewController
                nextVC!.delegate = self
            
        }else if(segue.identifier == "collectphotosegue"){
        }
    }
    
    @IBAction func Toinput(_ sender: Any) {
        
         performSegue(withIdentifier: "inputsegue", sender: nil)
        
    }
    
    //タイトル受け取り
    func sendText1(text1: String) {
        
        titles = text1
        
    }
    
    //日付受け取り
    func sendText2(text2: String) {
        dates = text2
    }
    
    //種類が1つなら
    func cutText1(cutcount: Int, cut1: String) {
        cutCouts = cutcount
        cut1Name = cut1
    }
    
    //種類が2つなら
    func cutText2(cutcount: Int, cut1: String, cut2: String) {
        
        cutCouts = cutcount
        cut1Name = cut1
        cut2Name = cut2
        
    }
    
   //種類が３つなら
    func cutText3(cutcount: Int, cut1: String, cut2: String, cut3: String) {
        
        cutCouts = cutcount
        cut1Name = cut1
        cut2Name = cut2
        cut3Name = cut3
        
    }
    
    //種類が４つなら
    func cutText4(cutcount: Int, cut1: String, cut2: String, cut3: String, cut4: String) {
        
        cutCouts = cutcount
        cut1Name = cut1
        cut2Name = cut2
        cut3Name = cut3
        cut4Name = cut4
        
    }
    
    //種類が５つなら
    func cutText5(cutcount: Int, cut1: String, cut2: String, cut3: String, cut4: String, cut5: String) {
        
        cutCouts = cutcount
        cut1Name = cut1
        cut2Name = cut2
        cut3Name = cut3
        cut4Name = cut4
        cut5Name = cut5
        
    }
    
    //種類が６つなら
    func cutText6(cutcount: Int, cut1: String, cut2: String, cut3: String, cut4: String, cut5: String, cut6: String) {
        
        cutCouts = cutcount
        cut1Name = cut1
        cut2Name = cut2
        cut3Name = cut3
        cut4Name = cut4
        cut5Name = cut5
        cut6Name = cut6
        
    }
    
    //データ受信
    func GetData(){
        
        let name = titles
        let date = dates
        let cutCount = cutCouts
        let celldata = CellData()
        
        celldata.Date = date
        celldata.Title = name
        celldata.CutCount = cutCount
        
        self.collectionlist.append(celldata)
        self.titles.removeAll()
        self.dates.removeAll()
        
        self.collectionview.reloadData()
        
    }
    
    //セルのLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem , height: widthPerItem)
        
    }
    
    //セルのLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
        
    }
    
    //セルの行間の設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
        
    }
    
    //cellが押された時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let next2VC = storyboard?.instantiateViewController(withIdentifier: "collectphotosegue") as! CollectPhotoViewController
        next2VC.name = collectionlist[indexPath.row].Title
        next2VC.number = indexPath.row
        next2VC.count = collectionlist[indexPath.row].CutCount
        navigationController?.pushViewController(next2VC, animated: true)
        
       }

    
    
}

//月日ファイル名でRealmに保存←collectionviewのセル
//年月日ファイル名でRealmに保存←collectphotoviewのリスト

