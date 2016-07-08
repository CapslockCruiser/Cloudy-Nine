//
//  LocationManager.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerPermissionDelegate {
    func userDidGrantLocationPermission()
}

class LocationManager: NSObject {

    // MARK: Private properties

    private let manager = CLLocationManager()

    // MARK: Public properties

    static var shared = LocationManager()
    var permissionDelegate: LocationManagerPermissionDelegate?

    // MARK: Initialization

    override init() {
        super.init()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    // MARK: Public API

    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }

}

// MARK: CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
            permissionDelegate?.userDidGrantLocationPermission()
        }
    }
}