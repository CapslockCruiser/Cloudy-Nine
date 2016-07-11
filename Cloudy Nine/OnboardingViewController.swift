//
//  OnboardingViewController.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class OnboardingViewController: BasePageViewController, LoadableFromStoryboard {

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageController([
            WelcomeViewController.loadFromStoryboard(),
            EnableLocationViewController.loadFromStoryboard()
        ])
    }
}