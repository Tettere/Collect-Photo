//
//  ViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/11/27.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
   // private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
   //  private let titles = ["1","2","3","4","5","6"]
    
  //  private let dates = ["5日","6日","7日","8日","9日","10日","11日"]
    
    
    var collectionlist = [String]()
    //１行あたり
    private let itemsPerRow: CGFloat = 2
  
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       collectionview.delegate = self
       collectionview.dataSource = self
        
    }
    //要素数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionlist.count
      }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let dateLabel = cell.contentView.viewWithTag(1) as! UILabel
        dateLabel.text = dates[indexPath.row]
        
        let titleLabel = cell.contentView.viewWithTag(2) as! UILabel
        titleLabel.text = titles[indexPath.row]
        
        cell.backgroundColor = .red  // セルの色
        
        
        return cell
      }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width: widthPerItem , height: widthPerItem)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return sectionInsets
       }
       // セルの行間の設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10.0
       }
    


}

