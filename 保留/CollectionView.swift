//
//  CollectionView.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2020/01/09.
//  Copyright © 2020 Hiroki Naito. All rights reserved.
//

import UIKit

class CollectionView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {

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
