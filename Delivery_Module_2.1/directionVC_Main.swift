//
//  directionVC_Main.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 07/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import UIKit
import MapKit

class directionVC_Main: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var directionBar: UIView!
   
    @IBOutlet weak var mapDirections: MKMapView!
    var MAP_CENTER = CLLocationCoordinate2D()
    var MAP_SPAN: Double?

    var startColor: String!
    var endColor: String!
    
    
    
    override func viewDidLoad() {
        mapDirections.delegate = self
        
        MAP_CENTER.latitude = 26.269977
        MAP_CENTER.longitude = -81.758183
        
        MAP_SPAN = 0.005
        super.viewDidLoad()
        startColor = "747373"
        endColor = "2d2e2c"
        setGradient (control: directionBar, startColor: startColor, endColor: endColor)
        setMap(map: mapDirections)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setGradient (control: UIView, startColor: String, endColor: String)
    {
    
        let gradient = Gradient_Layer()
        gradient.setColors(stColor: startColor, ndColor: endColor)
        gradient.frame = CGRect (x: 0, y:0, width: view.bounds.width, height: view.bounds.height )
        control.backgroundColor = UIColor.clear
        control.layer.insertSublayer(gradient.getGradient(), at: 0)
        
    }
    private func setMap(map: MKMapView)
    {
    
        var location = map.userLocation.coordinate
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
        map.setRegion(region, animated: true)
        map.regionThatFits(region)
        map.mapType = MKMapType.standard
        
        //map.addAnnotations(markers)
        
    
    }

 

}
