//
//  Annotation.swift
//  Delivery_Module_2.1
//
//  Created by Benseron-Developer on 03/11/16.
//  Copyright © 2016 Benseron-Developer. All rights reserved.
//

import MapKit
import AddressBook

class Marker: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let imgName: String?
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.imgName = ""
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    
    // annotation callout info button opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}
