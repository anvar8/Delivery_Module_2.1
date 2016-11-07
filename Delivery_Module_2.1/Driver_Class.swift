//
//  Driver_Class.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 02/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import Foundation

class Driver_Class
{
    private var _driverName: String
    private var _driverPhone: String
    private var _active: Bool
    private var _lat: Double
    private var _lon: Double
    private var _distanceTravelled: Double
    private var _eta: NSDate?

    init ()
    {
    
        _driverName = ""
        _driverPhone = ""
        _active = true
        _lat = 0
        _lon = 0
        _distanceTravelled = 0
        
    }
    
    
    public func setDriverName (value: String )
    {
        _driverName = value
    }
    
    public func getDriverName () -> String
    {
        return _driverName
    
    }
    public func setDTravelled (value: Double)
    {
        _distanceTravelled = value
    }
   
    public func getDTravelled (value: Double) -> Double
    {
        return _distanceTravelled
    }
    
    public func setETA (value: NSDate)
    {
    
        _eta = value
    }
    
    public func getETA () -> NSDate
    {
        return _eta!
    }
    

}
