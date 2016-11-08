//
//  outOrderCell.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 04/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class outOrderCell: UITableViewCell {

    
    @IBOutlet weak var lblCustName: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblDType: UILabel!
    @IBOutlet weak var lblCustPhone: UILabel!
    
    @IBOutlet weak var pBar: UIProgressView!
    @IBOutlet weak var lblDriver: UILabel!
    @IBOutlet weak var lblZone: UILabel!
    
    
    //cell.setFillColor(value: "#18281e")
    //cell.setProgress(value: 0.80)
    
     var _fillColor: String = "#45f442"
     var _progress: Float = 0.80
    
    
    /*
    public var fillColor: String
        {
        set {_fillColor = newValue}
        get { return _fillColor}
        
    }
    
    public var progress: Float{
        set {_progress = newValue}
        get {return _progress}
        
    }
 */    

  

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCell()

        
    }
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    public func setFillColor (value: String)
    {
        self._fillColor = value
        
    }
    public func getFillColor () -> String{
        
        
        return self._fillColor
    }
    
    
    public func setProgress (value: Float)
    {
        self._progress = value
        
    }
    public func getProgress () -> Float {
        
        
        return self._progress
    }
    
    public func setCell()
    
    {
    
    pBar.transform = CGAffineTransform(scaleX: 1, y: 10)
    let lblProgress = UILabel(frame: CGRect(x: 0, y: 10, width: pBar.frame.size.width, height: 8))
    lblProgress.font = UIFont(name:  "Avenir-Light", size: 8)
    lblProgress.textAlignment = .center
    lblProgress.text = String(Int(_progress * 100)) + "%"
    self.pBar.addSubview(lblProgress)
    self.pBar.progressTintColor = hexStringToUIColor(hexString: _fillColor, oPacity: nil)
    self.pBar.setProgress(_progress, animated: true)
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
