//
//  OnboardingViewController.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, LoadableFromStoryboard {

    // MARK: Private properties

    let pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    let welcomeViewController: WelcomeViewController = WelcomeViewController.loadFromStoryboard()
    let enableLocationViewController: EnableLocationViewController = EnableLocationViewController.loadFromStoryboard()

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageController()
    }
}

// MARK: Private implementation

private extension OnboardingViewController {
    func setupPageController() {
        pageController.dataSource = self

        pageController.setViewControllers([welcomeViewController], direction: .Forward, animated: true, completion: nil)

        pageController.view.frame = view.bounds
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        pageController.didMoveToParentViewController(self)
    }
}

// MARK: UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case enableLocationViewController:
            return welcomeViewController
        default:
            return nil
        }
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        switch viewController {
        case welcomeViewController:
            return enableLocationViewController
        default:
            return nil
        }
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 2
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}