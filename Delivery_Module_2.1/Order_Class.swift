//
//  Order_Class.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 02/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import Foundation
import UIKit


class Order_Class
{
    
 
    private var _orderTime: NSDate?
    private var _dType: String = ""
    private var _zone: Int = 0
    private var _orderType: String = ""
    private var _orderCat: String = ""
    private var _totalDistance: Double = 0
    
    public var customer = Customer_Class()
    public var driverAssigned = Driver_Class()
    
    
    
    
    public func setTotalDistance (value: Double)
    {
        _totalDistance = value
    }
    public func getTotalDistance (value: Double) -> Double
    {
        return _totalDistance
    }
    
    
    public func setOrderCat (value: String)
    {
        _orderCat = value
        
    }
    
    public func getOrderCat () -> String
    {
        return _orderCat
        
    }
    
    
    public func setOrderType (value: String)
    {
        _orderType = value
        
    }
    
    public func getOrderType () -> String
    {
        return _orderType
        
    }
    
    
    
    public func setZone (value: Int)
    {
        _zone = value
        
    }
    
    public func getZone () -> Int
    {
        return _zone
        
    }
    
    
    
    
    public func setOrderTime (value: NSDate)
    {
        _orderTime = value
    
    }
    
    public func getOrderTime () -> NSDate
    {
        return _orderTime!
        
    }
    
    
    public func setDType (value: String)
    {
        _dType = value
        
    }
    
    public func getDType () -> String
    {
        return _dType
        
    }
    
    
  
    

    
    
    
    





}
    
