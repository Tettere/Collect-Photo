//
//  MemberData.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/12.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import Foundation

class MemberData{
    
    var Member:String = ""
    var Color:Int = 0
  /*
    override init() {
      }
      
      // デシリアライズ処理（デコード処理とも呼ばれる）
    required init?(coder aDecoder: NSCoder) {
        Member = aDecoder.decodeObject(forKey: "Member") as! String
        Color =  aDecoder.decodeInteger(forKey: "Color") 
        
      }
      
      // シリアライズ処理（エンコード処理とも呼ばれる）
    func encode(with aCoder: NSCoder) {
          aCoder.encode(Member, forKey: "Member")
          aCoder.encode(Color, forKey: "Color")
      }
   */
}