//
//  newOrderCell.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 02/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class newOrderCell: UITableViewCell {

    
    
    @IBOutlet weak var lblCustName: UILabel!
    @IBOutlet weak var lblCustPhone: UILabel!
    @IBOutlet weak var lblDriverAssigned: UILabel!
    @IBOutlet weak var lblZone: UILabel!
    @IBOutlet weak var lblDiningType: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    var txtColor: String?
    var backColor: String?
    var opac_ty: Double?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            
            txtColor = "ffffff"
            backColor = "ea0e89"
            opac_ty = 0.4
            
        }
        else {
           
            txtColor = "000000"
            backColor = "ffffff"
            opac_ty = 1.0
           
        }
        self.backgroundColor = hexStringToUIColor(hexString: backColor! , oPacity: opac_ty)
        self.lblCustName.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
        self.lblCustPhone.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
        self.lblDriverAssigned.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
        self.lblZone.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
        self.lblDiningType.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
        self.lblTime.textColor = hexStringToUIColor(hexString: txtColor!, oPacity: nil)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
      
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
