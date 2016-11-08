//
//  directionVC.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 07/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class directionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dictRD = [[String]] ()
    
    @IBOutlet weak var tblMain: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMain.delegate = self
        tblMain.dataSource = self
       
        for x in 1...10
        {
            
                dictRD.append (["Route\(x)", "Distance \(x)"])
          
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictRD.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = Bundle.main.loadNibNamed("directionsCell", owner: self, options: nil)?.first as! directionsCell
        var counter = 0
        for eachPair in dictRD {
            
          
                if  counter == indexPath.row
                {
                    cell.lblRoute.text = eachPair[0]
                    cell.lblDistance.text = eachPair [1]
                
                }
            counter += 1
            
            
        
        }
        
        return cell

    }
}
