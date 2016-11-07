//
//  transitViewController.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 01/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class transitViewController: UIViewController {
    var vcToShow : Int = 1
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier: String(vcToShow), sender: self)
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    

}
