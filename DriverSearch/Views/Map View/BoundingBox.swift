//
//  BoundingBox.swift
//  DriverSearch
//
//  Created by Martin on 11/24/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import MapKit

struct BoundingBox {
    var northEast: CLLocationCoordinate2D
    var sounthWest: CLLocationCoordinate2D
    init(point1: CLLocationCoordinate2D = .zero, point2: CLLocationCoordinate2D = .zero) {
        northEast = point1
        sounthWest = point2
    }
}
