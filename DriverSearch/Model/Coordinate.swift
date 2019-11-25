//
//  Coordinate.swift
//  DriverSearch
//
//  Created by Martin on 11/18/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation

struct Coordinates: Hashable, Codable {
    static let zero = Coordinates(latitude: 0.0, longitude: 0.0)
    var latitude: Double
    var longitude: Double
}

extension Coordinates: CustomStringConvertible {
    var description: String {
        return "(\(latitude), \(longitude))"
    }
}
