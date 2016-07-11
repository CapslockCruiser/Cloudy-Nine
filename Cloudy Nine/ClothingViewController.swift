//
//  ClothingViewController.swift
//  Cloudy Nine
//
//  Created by William Choi on 7/6/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class ClothingViewController: UIViewController {

    // MARK: Private properties

    @IBOutlet private weak var titleLabel: UINavigationItem!
    @IBOutlet private weak var detailsButton: UIBarButtonItem!
    var weatherData: [WeatherData]! = []

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(userDidUpdateLocation),
            name: LocationManager.LocationUpdateNotificationName,
            object: nil
        )
        
        //Test OWMAPIClient below
        let location = Location(lat: 29.7, lon: 95.36, city: nil)
        OWMAPIClient.shared.getWeather(location, success: { weatherData in
            self.weatherData = weatherData
        })
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

// MARK: Private implementation

private extension ClothingViewController {
    @objc func userDidUpdateLocation(notification: NSNotification) {
        let location = LocationManager.shared.location
        
        titleLabel.title = location?.city
    }
}