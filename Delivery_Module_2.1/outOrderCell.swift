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
    

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      //var videoProgressView = UIProgressView(frame: CGRect(x: 40, y: self.view.frame.size.height / 2, width: self.view.frame.size.width - 80, height: 40))

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
}
