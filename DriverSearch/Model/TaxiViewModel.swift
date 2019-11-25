//
//  TaxiViewModel.swift
//  DriverSearch
//
//  Created by Martin on 11/19/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation
import CoreLocation

class TaxiViewModel: ObservableObject, Identifiable {
    @Published var identifier: String
    @Published var coordinate: Coordinates
    @Published var fleetType: FleetType = .TAXI
    @Published var heading: String
    @Published var distance: String
    var id = UUID.init()
    
    private static var defaultDistanceString = "n/a"
    
    init(with taxi: Taxi) {
        identifier = String(taxi.id)
        coordinate = taxi.coordinate
        fleetType = taxi.fleetType
        heading = taxi.heading
        distance = TaxiViewModel.defaultDistanceString
        NotificationCenter.default.addObserver(self, selector: #selector(onLocationUpdated(notification:)), name: .locationUpdated, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    private func onLocationUpdated(notification: Notification) {
        let userLocation = notification.object as! CLLocation
        let taxiLocation = CLLocation.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let locationDistance = userLocation.distance(from: taxiLocation)
        let df = MKDistanceFormatter()
        df.unitStyle = .full
        let prettyString = df.string(fromDistance: locationDistance)
        self.distance = prettyString.count > 0 ? prettyString : TaxiViewModel.defaultDistanceString
    }
}
