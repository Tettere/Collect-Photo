//
//  CollectPhotoViewController.swift
//  Collect Photo
//
//  Created by 内藤大輝 on 2019/12/15.
//  Copyright © 2019 Hiroki Naito. All rights reserved.
//

import UIKit

class CollectPhotoViewController: UIViewController {

    var name = String()
    
    var number = Int()
    
    
    @IBOutlet weak var navi: UINavigationItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         //print(name)
        // Do any additional setup after loading the view.
        self.navi.title = name
        
    }
    
    
    @IBAction func EditList(_ sender: Any) {
        /*
         let next3VC = storyboard?.instantiateViewController(withIdentifier: "Selectsegue") as! SelectMemberViewController
         next3VC.number = number
 */
         performSegue(withIdentifier: "Selectsegue", sender: nil)
        
         
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
