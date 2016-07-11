//
//  MainViewController.swift
//  Cloudy Nine
//
//  Created by William Choi on 7/6/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class MainViewController: BasePageViewController, LoadableFromInterfaceBuilder {

    // MARK: Private properties

    @IBOutlet private weak var landscapeContainerView: UIView!

    // MARK: UIViewController

    override func viewDidLoad() {

        super.viewDidLoad()

        let weatherViewModel = generateWeatherViewModel()
        setupLandscapeView(weatherViewModel)

        setupPageController([
            EmptyViewController.loadFromInterfaceBuilder(),
            ClothingViewController.loadFromInterfaceBuilder(),
            DetailViewController.loadFromInterfaceBuilder()
        ], startingPage: 1)

        setupSettingsButton()
    }
}

// MARK: Private implementation

private extension MainViewController {
    func generateWeatherViewModel() -> WeatherViewModel {
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        let components = calendar.components([.Hour], fromDate: date)

        return WeatherViewModel(hour: components.hour)
    }

    func setupLandscapeView(weatherViewModel: WeatherViewModel) {
        let landscapeView = LandscapeView.loadFromInterfaceBuilder() as LandscapeView
        landscapeView.weatherViewModel = weatherViewModel
        landscapeView.frame = landscapeContainerView.bounds
        landscapeContainerView.addSubview(landscapeView)
    }

    func setupSettingsButton() {
        let settingsButton = UIButton(type: .System)
        settingsButton.setTitle("Settings", forState: .Normal)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsButton)
        view.addConstraints(
            [
                NSLayoutConstraint(
                    item: settingsButton,
                    attribute: .Trailing,
                    relatedBy: .Equal,
                    toItem: view,
                    attribute: .Trailing,
                    multiplier: 1.0,
                    constant: -16),
                NSLayoutConstraint(
                    item: settingsButton,
                    attribute: .Top,
                    relatedBy: .Equal,
                    toItem: view,
                    attribute: .Top,
                    multiplier: 1.0,
                    constant: 16)
            ]
        )
    }
}