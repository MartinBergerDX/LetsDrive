//
//  TaxiAnnotation.swift
//  DriverSearch
//
//  Created by Martin on 11/24/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation

class TaxiAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(taxi: Taxi) {
        self.title = taxi.id
        self.subtitle = taxi.fleetType.rawValue
        self.coordinate = CLLocationCoordinate2D.init(coordinate: taxi.coordinate)
    }
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
