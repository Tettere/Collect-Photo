//
//  ViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/11/27.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,GetDataprotocol {
   
    
   private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    //タイトル入力
    var titles:String = ""
    var titleLabel = UILabel()
    
    //日付入力
    var dates:String = ""
    var dateLabel = UILabel()
    
    //cellを格納
    var collectionlist = [CellData]()
    
    //１行あたり
    private let itemsPerRow: CGFloat = 2
  
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       collectionview.delegate = self
       collectionview.dataSource = self
        
        
    }
    
    //override func viewDidAppear(_ animated: Bool) {
    //       super.viewDidAppear(animated)
     //  }
  //  override func viewWillAppear(_ animated: Bool) {
   //          super.viewWillAppear(animated)
             //データを引っ張ってくる
    //          GetData()
      //        collectionview.reloadData()
             
     //    }
   // override func viewWillAppear(_ animated: Bool) {
     //   super.viewWillAppear(animated)

      //  if let presented = self.presentedViewController {
        //    if type(of: presented) = inputViewController.self {
                //PopupViewControllerから戻ってきたときはrefresh()
        //        self.GetData()
        //        self.collectionview.reloadData()
       //     }
      //  }
 //   }
    
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
           if let NextVC = segue.destination as? inputViewController {
            NextVC.delegate = self
           }
       }
    
    //タイトル受け取り
     func sendText1(text1: String) {
              titles = text1
          }
    //日付受け取り
     func sendText2(text2: String) {
              dates = text2
       }

    //データ受信
    func GetData(){
        let name = titles
        let date = dates
        let celldata = CellData()
        
        celldata.Date = date
        celldata.Title = name
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
    
    
 
}



