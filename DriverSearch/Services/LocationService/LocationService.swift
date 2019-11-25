//
//  LocationService.swift
//  DriverSearch
//
//  Created by Martin on 11/25/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import Foundation
import CoreLocation

extension Notification.Name {
    static let locationUpdated = Notification.Name("LocationService::LocationUpdated")
}

class LocationService: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error is = \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locValue: CLLocation = manager.location {
            print("Current Location = \(locValue.coordinate.latitude) \(locValue.coordinate.longitude)")
            NotificationCenter.default.post(name: .locationUpdated, object: locValue)
        }
    }
    
    func start() {
        locationManager.startUpdatingLocation()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationServicesEnabledInSettings() -> Bool {
        return CLLocationManager.locationServicesEnabled();
    }
    
    func permissionsGranted() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
}
