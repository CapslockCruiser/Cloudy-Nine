//
//  Geocoder.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import Foundation
import CoreLocation

struct Geocoder {

    // MARK: Private properties

    private let geocoder = CLGeocoder()

    // MARK: Public API

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