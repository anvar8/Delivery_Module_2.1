//
//  Customer_Class.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 02/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//
import Foundation
class Customer_Class
{
    
    private var _custName: String
    private var _custPhone: String
    
    init ()
    {
        _custName = ""
        _custPhone = ""
    }
    
    public func setCustName (value: String)
    {
        _custName = value
    
    }
    public func getCustName () -> String
    {
       return _custName
        
    }
    
    public func setCustPhone (value: String)
    {
        _custPhone = value
        
    }
    public func getCustPhone () -> String
    {
        return _custPhone
        
    }
    
    
}
