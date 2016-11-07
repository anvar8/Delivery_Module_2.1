//
//  Gradient_Layer.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 31/10/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class Gradient_Layer: CAGradientLayer {
    var startColor: String = ""
    var endColor: String = ""
    

    public func setColors (stColor:String, ndColor: String)
    {
    
        self.startColor = stColor
        self.endColor = ndColor
        
    }

    public func getGradient () -> CAGradientLayer
    {
        
   self.colors = [hexStringToUIColor(hexString: self.startColor).cgColor, hexStringToUIColor(hexString: self.endColor).cgColor]
        
      /*
    self.colors = [hexStringToUIColor(hexString: startColor).cgColor, hexStringToUIColor(hexString: startColor).cgColor, hexStringToUIColor(hexString: endColor).cgColor, hexStringToUIColor(hexString: endColor).cgColor, hexStringToUIColor(hexString: startColor).cgColor, hexStringToUIColor(hexString: startColor).cgColor]
 */
        
    //self.locations = [0.0, 0.15, 0.25, 0.75, 0.85, 1.0]
    //self.frame = self.bounds
    self.startPoint = CGPoint(x: 1.0, y: 1.0)
    self.endPoint = CGPoint(x: 1.0, y: 0.0)
    return self
    
    }
        private func hexStringToUIColor (hexString: String) -> UIColor {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
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
            alpha: CGFloat(1.0)
        )
    }


}
