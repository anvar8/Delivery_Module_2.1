//
//  tableMenu.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 31/10/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import Foundation
import UIKit

class tableMenu: UITableViewController
{
    @IBOutlet var mainTable: UITableView!
    var menuItems = [String]()
    override func viewDidLoad(){
    menuItems = ["Table Layout", "Check Stats","Bar Tab", "Phone Order"]
        let gradient = Gradient_Layer()
        gradient.setColors(stColor: "7d7e7d", ndColor: "0e0e0e")
        gradient.frame = CGRect (x: 0, y:0, width: view.bounds.width, height: view.bounds.height )
        mainTable.backgroundColor = UIColor.clear
        mainTable.layer.insertSublayer(gradient.getGradient(), at: 0)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45))
        /* Create custom view to display section header... */
        var label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 45))
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "MENU ITEMS"
        label.textColor = UIColor.white
        let gradient = Gradient_Layer()
        gradient.setColors(stColor: "232526", ndColor: "414345")
        gradient.frame = CGRect (x: 0, y:0, width: view.bounds.width, height: view.bounds.height )
        view.backgroundColor = UIColor.clear
        view.layer.insertSublayer(gradient.getGradient(), at: 0)
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
       // let cell = Bundle.main.loadNibNamed("dmMainMenuCellTableViewCell", owner: self, options:nil)?.first as! UITableViewCell
   let cell = Bundle.main.loadNibNamed("dmMainMenuCellTableViewCell", owner: self, options: nil)?.first as! dmMainMenuCellTableViewCell
        
        
        //cell.imgIcon.image = #imageLiteral(resourceName: "iconUnavail")
        //cell.lblTitle.text = menuItems [indexPath.row]
        //cell.setViewID = menuItems [indexPath.row]

        
    return cell
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath: IndexPath = mainTable.indexPathForSelectedRow! as IndexPath
        let cell = mainTable.cellForRow(at: indexPath)! as! dmMainMenuCellTableViewCell
        let DestVC = segue.destination as! mainTabbedPanel
       // DestVC.varView = cell.lblTitle
    }
    
  
    
 

}
