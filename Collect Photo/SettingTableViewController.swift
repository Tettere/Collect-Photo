//
//  SettingTableViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/09.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // セクション毎に何行
        switch section {
            case 0: // 「設定」のセクション
                return 2
            case 1: // 「その他」のセクション
                return 1
            default: //
                return 0
        }
    }

 

}
