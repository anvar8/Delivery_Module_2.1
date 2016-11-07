//
//  dmMainMenuCellTableViewCell.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 31/10/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit



 class dmMainMenuCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    private var viewID = String()
      override func awakeFromNib() {
       super.awakeFromNib()
        // Initialization code
        
       let gradient = Gradient_Layer()
    gradient.setColors(stColor: "7d7e7d", ndColor: "0e0e0e")
       gradient.frame = CGRect (x: 0, y:0, width: self.bounds.width * 1.2, height: self.bounds.height * 1.2)
       
        self.backgroundColor = UIColor.clear
        self.layer.insertSublayer(gradient.getGradient(), at: 0)
        lblTitle.textColor = UIColor.white
        
    }

    public func setViewID (vID:String)
    {
        
     self.viewID = vID
        
    }
    public func getViewID () -> String
    {
        return self.viewID
    }
    
    
        
}
