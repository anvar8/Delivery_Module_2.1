//
//  directionsCell.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 07/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit

class directionsCell: UITableViewCell {

    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblRoute: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
