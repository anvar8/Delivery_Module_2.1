//
//  mainTabbed_Panel.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 02/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit
import Foundation
import MapKit


class mainTabbed_Panel: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var btnNewOrders: UIButton!
    @IBOutlet weak var btnComplete: UIButton!
    @IBOutlet weak var btnDriverStatus: UIButton!
    @IBOutlet weak var btnFuture: UIButton!
    @IBOutlet weak var btnOut: UIButton!

    @IBOutlet weak var vcNew: UIView!
    @IBOutlet weak var vcOut: UIView!
    @IBOutlet weak var vcComplete: UIView!
    @IBOutlet weak var vcFuture: UIView!
    @IBOutlet weak var vcDriverStatus: UIView!
    
    @IBOutlet weak var newTabTable: UITableView!
    
    @IBOutlet weak var outTabTable: UITableView!
    @IBOutlet weak var tblActiveDrivers: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    var btnVCCollection = [UIButton: UIView] ()
    var cornerRad: CGFloat = 5.0
    
    
 
    
    
   
   
    
    
    /*
    struct Order {
        var CustName: String = ""
        var CustPhone: String = ""
        var OrderTime: String = ""
        var DiningType: String = ""
        var Zone: String = ""
        var Driver: String = ""
        
        
    }
    */
    
    
    struct structOrder
    {
        var CustName: String = ""
        var CustPhone: String = ""
        var OrderTime: NSDate?
        var DType: String = ""
        var Zone: Int = 0
        var DriverAssigned: String = ""
        var Progress: Double = 0
        var OrderCat: String = ""
        var OrderType: String = ""
    }
    
 

        struct outOrder {
        var CustName: String = ""
        var CustPhone: String = ""
        var OrderTime: String = ""
        var DiningType: String = ""
        var Zone: String = ""
        var Driver: String = ""
        var progress: Double = 0.0
        var eta: NSDate
        var totalDistance: Double
        var distanceTravlled: Double
        
      
    }
    
    var arrayOrderStruct = [structOrder] ()
        //var orders = [Order]()
    var orders = [Order_Class()]
    var activeDrivers = [String]()
    var markers = [Marker]()
    var MAP_CENTER = CLLocationCoordinate2D()
    var MAP_SPAN: Double?

    
  

    
    override func viewDidLoad() {
        
        MAP_CENTER.latitude = 26.269977
        MAP_CENTER.longitude = -81.758183
        
        MAP_SPAN = 0.005
        
        super.viewDidLoad()
        newTabTable.delegate = self
        newTabTable.dataSource = self
        mapView.delegate = self
        
        tblActiveDrivers.delegate = self
        tblActiveDrivers.dataSource = self
        
        
        outTabTable.dataSource = self
        outTabTable.delegate = self
        //47.170393, -98.457270
        //47.228216, -98.567315
        let driverMarker1 = Marker (title: "MARTIN \n rating goes here", locationName: "4313, Covery Cr, FL", coordinate: CLLocationCoordinate2D(latitude: 26.269977, longitude: -81.758183))
        let driverMarker2 = Marker (title: "Jerry \n rating goes here", locationName: "15161 Palmer Lake Circle", coordinate: CLLocationCoordinate2D(latitude: 26.267927, longitude:  -81.750842))
        markers.append(driverMarker1)
        markers.append(driverMarker2)
        
        setMap()
        setActiveDrivers()
        //populate orderInfo structure with values to mimick data received from server
       
        for counter in 1...20
        {
             var orderInfo = structOrder()
            orderInfo.CustName = "Customer # \(counter)"
            orderInfo.CustPhone = "123-22-33-3\(counter)"
            orderInfo.DType = "Delivery"
            orderInfo.Zone = counter
            orderInfo.DriverAssigned = "Driver # \(counter)"
            
            
            //orderInfo.OrderType = "New"
            
            // make 5 orders of each type in the list
            
            if counter <= 5
            {
                orderInfo.OrderType = "Future"
            
            }
            else if counter <= 10
            {
                orderInfo.OrderType = "Complete"
            }
            else if counter <= 15
            {
                orderInfo.OrderType = "Out"
                
            }
            else if counter <= 20
            {
                orderInfo.OrderType = "New"
            }
 
            
            arrayOrderStruct.append(orderInfo)
           
        }
        
        /*
        for eachOrderStructure in arrayOrderStruct
        {
            print (eachOrderStructure.CustName)
        
        }*/
        
        //populate array of order objects with data from structure
        setOrders(oInfo: arrayOrderStruct)
        // set up dictionary of buttons and corresponding views to handle visibility on button click
        btnVCCollection[btnNewOrders] = vcNew
        btnVCCollection[btnComplete] = vcComplete
        btnVCCollection[btnDriverStatus] = vcDriverStatus
        btnVCCollection[btnFuture] = vcFuture
        btnVCCollection[btnOut] = vcOut
        
        
        btnNewOrders.layer.cornerRadius = cornerRad
        btnComplete.layer.cornerRadius = cornerRad
        btnDriverStatus.layer.cornerRadius = cornerRad
        btnFuture.layer.cornerRadius = cornerRad
        btnOut.layer.cornerRadius = cornerRad

        btnNewOrders.backgroundColor = hexStringToUIColor(hexString: "ea0e89")
        btnNewOrders.setTitleColor(hexStringToUIColor(hexString: "ffffff"), for: UIControlState.normal)
        
        btnNewOrders.setTitle("New (\(orders.count))", for: UIControlState.normal)

    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let blankCell = UITableViewCell()
    let index: Int = indexPath.row
     let orderRecord = orders [index]
    //populate table in New tab
    if tableView == newTabTable {
       
      let  cell = Bundle.main.loadNibNamed("newOrderCell", owner: self, options: nil)?.first as! newOrderCell
      
        if orderRecord.getOrderType() == "New"
            {
           
                cell.lblCustName.text = orderRecord.customer.getCustName()
               //print (orders[index].customer.getCustName())
                cell.lblCustPhone.text = orderRecord.customer.getCustPhone()
                cell.lblTime.text = "n/a "
                cell.lblDiningType.text = orderRecord.getDType()
                cell.lblZone.text = String (orderRecord.getZone())
                cell.lblDriverAssigned.text = orderRecord.driverAssigned.getDriverName()
                cell.selectionStyle = UITableViewCellSelectionStyle.none
               
    
            }
       return cell
      
    }
    
    //populate table in out tab
    else if tableView == outTabTable
        {
                let  cell = Bundle.main.loadNibNamed("outOrderCell", owner: self, options: nil)?.first as! outOrderCell
                if orderRecord.getOrderType() == "Out"
                    {
                            cell.lblCustName.text =  orderRecord.customer.getCustName()
                            print(orderRecord.customer.getCustName())
                            cell.lblCustPhone.text = orderRecord.customer.getCustPhone()
                            cell.lblTime.text = "n/a "
                            cell.lblDType.text = orderRecord.getDType()
                            cell.lblZone.text = String (orderRecord.getZone())
                            cell.lblDriver.text = orderRecord.driverAssigned.getDriverName()
                            cell.selectionStyle = UITableViewCellSelectionStyle.none
                            cell.pBar.progress = 36.0
                            let lblProgress = UILabel(frame: CGRect(x: 0, y: -50, width: cell.pBar.frame.size.width, height: 25))
                            lblProgress.textAlignment = .center
                            lblProgress.text = "36"
                            cell.pBar.addSubview(lblProgress)
                            cell.selectionStyle = UITableViewCellSelectionStyle.none
    
                    }
            
            return cell
        }


        
    // populate active drivers window
        else if tableView == tblActiveDrivers
            {
                let cell = Bundle.main.loadNibNamed("cellActiveDrivers", owner: self, options: nil)?.first as! cellActiveDrivers
                cell.lblDriverName.text = activeDrivers[index]
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                //cell.btnIcon.tag = indexPath.row
                //cell.btnIcon.addTarget(self, action: "showDriverDetails", for: UIControlEvents.touchUpInside)
                //cell.btnIcon.addTarget(self, action: Selector(("showDriverDetails")), for: UIControlEvents.touchUpInside)
                return cell
            }
        
    else
    {
        return blankCell
    
    }

   
    
    
    }
    
    // hide pand with active drivers when called
    private func showDriverDetails(_ sender: UIButton)
    {
        
        if sender.tag == 0
        {
            sender.isHidden = true
        }
    
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return 5
        
        var nOR: Int = 0

        if tableView == newTabTable
        {
            nOR = 0
         for eachOrder in orders
         {
            if eachOrder.getOrderType() == "New"
            {
                nOR += 1
              
            }
            
         
        }
              return nOR
        
        }
            
        else if tableView == tblActiveDrivers
        {
            nOR = 0
            for eachOrder in orders
            {
                if eachOrder.getOrderType() == "Out"
                {
                    
                    nOR += 1
                  
                }
                
            }
              return nOR
        }
        else if tableView == tblActiveDrivers
        {
            nOR = activeDrivers.count
            return nOR
        
        }
        else
        {
            return 0
        }
        
 
       
    }
    
    

    
    

    
    
    @IBAction func btnNew(_ sender: Any) {
        btnAction(btnClicked: sender as! UIButton)
    }
    
    @IBAction func btnOut(_ sender: Any) {
         btnAction(btnClicked: sender as! UIButton)
    }
    
    @IBAction func btnComplete(_ sender: Any) {
         btnAction(btnClicked: sender as! UIButton)
    }
    
    @IBAction func btnFuture(_ sender: Any) {
         btnAction(btnClicked: sender as! UIButton)
    }
    
    @IBAction func btnDStatus(_ sender: Any) {
         btnAction(btnClicked: sender as! UIButton)
    }
    
    
      func btnAction(btnClicked: UIButton) {
        //guard sender is UIButton else {return}
       
        for (button, vcT) in btnVCCollection
        {
            if button.titleLabel?.text == btnClicked.titleLabel?.text
            {
                showView(vc: vcT)
                button.backgroundColor = hexStringToUIColor(hexString: "ea0e89")
                button.setTitleColor(hexStringToUIColor(hexString: "ffffff"), for: UIControlState.normal)
                
                if vcT.tag == 2
                {
                    activeDrivers.removeAll()
                    tblActiveDrivers.reloadData()
                }
                else
                {
                    setActiveDrivers()
                    tblActiveDrivers.reloadData()
                }
              
            }
            else {
            hideView(vc: vcT)
            button.backgroundColor = hexStringToUIColor(hexString: "ffffff")
            button.setTitleColor(hexStringToUIColor(hexString: "000000"), for: UIControlState.normal)
            }
        
        }
 
    }
    
    func showView (vc: UIView)
    {
        vc.isHidden = false
    }
    func hideView (vc: UIView)
    {
        vc.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    func setMap()
    {
        
     //   let driverMarker = Marker (title: "MARTIN \n rating goes here", locationName: "4313, Covery Cr, FL", coordinate: CLLocationCoordinate2D(latitude: 47.170393, longitude: -98.457270))
        var location = mapView.userLocation.coordinate
        var region = MKCoordinateRegion()
        var span = MKCoordinateSpan()
        location.latitude = MAP_CENTER.latitude
        //37.250556;
        location.longitude = MAP_CENTER.longitude
        //-96.358333;
        span.latitudeDelta = MAP_SPAN!
        span.longitudeDelta = MAP_SPAN!
        region.span = span
        region.center = location
        mapView.setRegion(region, animated: true)
        mapView.regionThatFits(region)
        mapView.mapType = MKMapType.standard
        
        mapView.addAnnotations(markers)

    }
    
func setActiveDrivers()
{
    activeDrivers = ["Emma Wattson", "Sam", "Daniel Radcliffe", "Nick", "Martin"]
    
}

    
    
private func setOrders (oInfo: [structOrder])
    {
            orders.removeAll()
        
          let order = Order_Class()
            for oStructure in oInfo
          //  for idx in 0..<oInfo.count
            {
                
                
                        order.customer.setCustName(value: oStructure.CustName)
                       // print (order.customer.getCustName())
                        order.customer.setCustPhone ( value: oStructure.CustPhone)
                        //print (order.customer.getCustPhone())
                        order.setDType(value: oStructure.DType)
                        order.setOrderType(value: oStructure.OrderType)
                        order.setZone(value: oStructure.Zone)
                        order.driverAssigned.setDriverName(value: "John Doe")
                        //print (order.driverAssigned.getDriverName())
                
                        //print (order.getOrderType())
                
                        orders.append(order)
                        //print (orders.count)
             
            }
        

    }
    
    
func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
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
