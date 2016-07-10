//
//  LocationManager.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let lat: Double
    let lon: Double
    let city: String?
}

protocol LocationManagerPermissionDelegate {
    func userDidGrantLocationPermission()
}

class LocationManager: NSObject {

    // MARK: Private properties

    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    // MARK: Public properties

    static var shared = LocationManager()
    var permissionDelegate: LocationManagerPermissionDelegate?
    var permissionGranted: Bool {
        return CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse
    }
    var location: Location?

    static let LocationUpdateNotificationName = "LocationManagerLocationUpdateNotification"

    // MARK: Initialization

    override init() {
        super.init()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    // MARK: Public API

    func start() -> Bool {
        guard permissionGranted else {
            return false
        }

        manager.startMonitoringSignificantLocationChanges()
        return true
    }

    func stop() {
        manager.stopMonitoringSignificantLocationChanges()
    }

    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
}

// MARK: Private implementation

private extension LocationManager {
    func cityFromLocation(location: CLLocation, completion: (String?) -> Void) {
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                completion(nil)
                return
            }

            completion(placemark.locality)
        }
    }
}

// MARK: CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
            manager.startMonitoringSignificantLocationChanges()

            permissionDelegate?.userDidGrantLocationPermission()
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newestLocation = locations.first else {
            return
        }

        cityFromLocation(newestLocation) { city in
            self.location = Location(lat: newestLocation.coordinate.latitude, lon: newestLocation.coordinate.longitude, city: city)

            let notification = NSNotification(
                name: LocationManager.LocationUpdateNotificationName,
                object: nil,
                userInfo: nil
            )

            NSNotificationCenter.defaultCenter().postNotification(notification)
        }
    }
}