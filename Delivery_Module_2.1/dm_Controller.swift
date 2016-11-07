//
//  dm_Controller.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 01/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit
var tabID : Int? = 2

class dm_Controller: UIViewController {
    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var btnNew: UIButton!
    @IBOutlet weak var btnOut: UIButton!
    @IBOutlet weak var btnComplete: UIButton!
    @IBOutlet weak var btnDriverStatus: UIButton!
    @IBOutlet weak var btnFuture: UIButton!
    
    /*
     
     
     
    @IBAction func about(sender: AnyObject) {
        performSegueWithIdentifier("about", sender: sender)
    }
 */
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnNew.layer.cornerRadius = 10
        btnOut.layer.cornerRadius = 10
        btnComplete.layer.cornerRadius = 10
        btnDriverStatus.layer.cornerRadius = 10
        btnFuture.layer.cornerRadius = 10
            
        btnNew.addTarget(self, action:Selector("showTab"), for: UIControlEvents.touchUpInside)
        
            btnFuture.addTarget(self, action:Selector("showTab"), for: UIControlEvents.touchUpInside)

            btnOut.addTarget(self, action:Selector("showTab"), for: UIControlEvents.touchUpInside)

            btnComplete.addTarget(self, action:Selector("showTab"), for: UIControlEvents.touchUpInside)

            btnDriverStatus.addTarget(self, action:Selector("showTab"), for: UIControlEvents.touchUpInside)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showTab(_ sender: Any)
        
    {
        let button = (sender as! UIButton)
        tabID = button.tag
        /*
         if button.tag == 1 {
         //your stuff!
         tabID
         }
         else if button.tag == 2 {
         //your stuff!
         }
         else if button.tag == 3 {
         //your stuff!
         }
         else if button.tag == 4 {
         //your stuff!
         }
         else if button.tag == 5{
         //your stuff!
         }*/
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "embedViewController") {
            let transitVC = segue.destination as! transitViewController
            transitVC.vcToShow = tabID!
            
        }
    }
    
        
   
}
