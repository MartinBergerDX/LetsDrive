//
//  Taxi.swift
//  DriverSearch
//
//  Created by Martin on 11/18/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation

struct Taxi: Decodable, Hashable {
    var id: String
    var coordinate: Coordinates
    var fleetType: FleetType = .TAXI
    var heading: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case coordinate
        case fleetType
        case heading
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = String(((try? container.decode(Int.self, forKey: .id)) ?? 0))
        coordinate = (try? container.decode(Coordinates.self, forKey: .coordinate)) ?? Coordinates.zero
        fleetType = (try? container.decode(FleetType.self, forKey: .fleetType)) ?? FleetType.TAXI
        heading = (try? container.decode(String.self, forKey: .heading)) ?? "0"
    }
    
    init(from taxi: ReceivedTaxi) {
        id = taxi.identifier
        coordinate = Coordinates(latitude: Double(taxi.coordinate.x), longitude: Double(taxi.coordinate.y))
        fleetType = FleetType.init(rawValue: taxi.fleetType)!
        heading = taxi.heading as String
    }
}
