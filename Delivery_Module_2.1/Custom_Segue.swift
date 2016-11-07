//
//  Custom_Segue.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 01/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import Foundation
import UIKit

class Custom_Segue: UIStoryboardSegue
{
override func perform ()
{
    let sourceVC = self.source
    let destinationVC = self.destination
    
    destinationVC.view.bounds = sourceVC.view.bounds
    
    sourceVC.view.addSubview(destinationVC.view)
    
   // sourceVC.presentedViewController(destinationVC, animated:false, completion:nil)
}


}



