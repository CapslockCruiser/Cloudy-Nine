//
//  ClothingViewController.swift
//  Cloudy Nine
//
//  Created by William Choi on 7/6/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit
import CoreLocation

class ClothingViewController: UIViewController {

    // MARK: Private properties

    @IBOutlet private weak var titleLabel: UINavigationItem!
    @IBOutlet private weak var detailsButton: UIBarButtonItem!

    private let geocoder = Geocoder()
    var weatherData: [WeatherData] = []

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(userDidUpdateLocation),
            name: LocationManager.LocationUpdateNotificationName,
            object: nil
        )

        LocationManager.shared.start()
        
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

// MARK: Private implementation

private extension ClothingViewController {
    @objc func userDidUpdateLocation(notification: NSNotification) {
        guard let location = notification.userInfo?[LocationManager.LocationUpdateNotificationLocationKey] as? CLLocation else {
            return
        }

        geocoder.cityFromLocation(location) { city in
            self.titleLabel.title = city
        }
        
        OWMAPIClient.shared.getCurrentWeather(location, success: { weatherData in
            self.weatherData = weatherData
        })
    }
}