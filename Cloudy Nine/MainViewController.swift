//
//  MainViewController.swift
//  Cloudy Nine
//
//  Created by William Choi on 7/6/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Private properties

    @IBOutlet private weak var titleLabel: UINavigationItem!
    @IBOutlet private weak var detailsButton: UIBarButtonItem!

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(userDidUpdateLocation),
            name: LocationManager.LocationUpdateNotificationName,
            object: nil
        )
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

// MARK: Private implementation

private extension MainViewController {
    @objc func userDidUpdateLocation(notification: NSNotification) {
        let location = LocationManager.shared.location

        titleLabel.title = location?.city
    }
}