//
//  CLLocationCoordinate2D+Addons.swift
//  DriverSearch
//
//  Created by Martin on 11/24/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    static let zero: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 0, longitude: 0)
    init(coordinate: Coordinates) {
        self.init()
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
}
