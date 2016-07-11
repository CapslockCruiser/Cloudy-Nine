//
//  EnableLocationViewController.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class EnableLocationViewController: UIViewController, LoadableFromStoryboard {

}

// MARK: Private implementation

private extension EnableLocationViewController {
    @IBAction func enableLocationButtonTapped(sender: AnyObject) {
        let locationManager = LocationManager.shared
        locationManager.permissionDelegate = self
        locationManager.requestAuthorization()
    }
}

// MARK: LocationManagerDelegate

extension EnableLocationViewController: LocationManagerPermissionDelegate {
    func userDidGrantLocationPermission() {
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else {
            return
        }

        let mainViewController = MainViewController.loadFromStoryboard() as MainViewController
        appDelegate.transitionToViewController(mainViewController)
    }
}