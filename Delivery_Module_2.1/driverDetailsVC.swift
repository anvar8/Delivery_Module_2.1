//
//  driverDetailsVC.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 08/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class driverDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dictDriverDetails = [String: String] ()
    var startColor: String!
    var endColor: String!
   
    @IBOutlet weak var topView: UIView!

    
    @IBOutlet weak var tblDriverDetails: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
          dictDriverDetails ["Employee:"] = "Martin"
          dictDriverDetails ["Clocked in:"] = "28/04/2016 11:14 AM"
          dictDriverDetails ["Est. Return Time:"] = "No Value"
          dictDriverDetails ["Out Tickets:"] = "0"
          dictDriverDetails ["Total Tickets:"] = "14"
          dictDriverDetails ["Avg Onroad Time:"] = "28"
          dictDriverDetails ["Avg Del Time:"] = "36"
          dictDriverDetails ["Avg Wait Time:"] = "15"
          dictDriverDetails ["Between Runs:"] = "10"
          dictDriverDetails ["Account:"] = "No Value"

        tblDriverDetails.delegate = self
        tblDriverDetails.dataSource = self
        tblDriverDetails.separatorStyle = UITableViewCellSeparatorStyle.none
        
        startColor = "747373"
        endColor = "2d2e2c"
       setGradient (control: topView, startColor: endColor , endColor:startColor)
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictDriverDetails.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = Bundle.main.loadNibNamed("driverDetails", owner: self, options: nil)?.first as! driverDetails
        
        for (index, key) in dictDriverDetails.keys.sorted().enumerated()
        {
            if index == indexPath.row
            {
            
                cell.lblTitle.text = key
            }
        }
        
        
        for (index, value) in dictDriverDetails.values.sorted().enumerated()
        {
            if index == indexPath.row
            {
                
                cell.lblValue.text = value
            }
        }
        
        
        
        //cell.lblTitle.text = dictDriverDetails.keys [indexPath.row]
        //cell.lblValue.text = dictDriverDetails.values [indexPath.row]
        
        return cell
        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setGradient (control: UIView, startColor: String, endColor: String)
    {
        
        let gradient = Gradient_Layer()
        gradient.setColors(stColor: startColor, ndColor: endColor)
        gradient.frame = CGRect (x: 0, y:0, width: view.bounds.width, height: control.bounds.height )
        control.backgroundColor = UIColor.clear
        control.layer.insertSublayer(gradient.getGradient(), at: 0)
        
    }
    



}
