//
//  ViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/11/27.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate{
    
    @IBOutlet weak var TabBar: UITabBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TabBar.delegate = self
    }


}

