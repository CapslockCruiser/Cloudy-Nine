//
//  OnboardingViewController.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class OnboardingViewController: BasePageViewController, LoadableFromInterfaceBuilder {

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageController([
            WelcomeViewController.loadFromInterfaceBuilder(),
            EnableLocationViewController.loadFromInterfaceBuilder()
        ])
    }
}