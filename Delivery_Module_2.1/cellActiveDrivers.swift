//
//  cellActiveDrivers.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 03/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class cellActiveDrivers: UITableViewCell {
    
    
    @IBOutlet weak var lblDriverName: UILabel!
    
    @IBOutlet weak var btnIcon: UIButton!

    var txtColor: String?
    var backColor: String?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            
            txtColor = "ffffff"
            backColor = "ea0e89"
            btnIcon.setBackgroundImage(#imageLiteral(resourceName: "driverIcon_HL"), for: UIControlState.normal)
         
            
        }
        else {
            
            txtColor = "000000"
            backColor = "ffffff"
            btnIcon.setBackgroundImage(#imageLiteral(resourceName: "driverIcon"), for: UIControlState.normal)
           
            
        }
        self.backgroundColor = hexStringToUIColor(hexString: backColor! , oPacity: nil)
        self.lblDriverName.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
        

    }

    

    
    
    
    
    

    private func hexStringToUIColor (hexString: String, oPacity: Double?) -> UIColor {
        
        
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        var op: Double = 1.0
        
        if oPacity != nil
            
        {
            
            op = oPacity!
            
        }
        
        
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(CGFloat (op))
        )
    }
    
}
