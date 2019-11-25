//
//  TaxiViewModel.swift
//  DriverSearch
//
//  Created by Martin on 11/19/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation

class TaxiViewModel: ObservableObject, Identifiable {
    @Published var identifier: String
    @Published var coordinate: Coordinates
    @Published var fleetType: FleetType = .TAXI
    @Published var heading: String
    var id = UUID.init()
    
    init(with taxi: Taxi) {
        identifier = String(taxi.id)
        coordinate = taxi.coordinate
        fleetType = taxi.fleetType
        heading = taxi.heading
    }
}
