//
//  BasePageViewController.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/11/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class BasePageViewController: UIViewController {

    // MARK: Private properties

    private let pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    private var viewControllers = [UIViewController]()
    private var startingPage = 0

    // MARK: Public API

    func setupPageController(viewControllers: [UIViewController], startingPage: Int = 0) {
        self.viewControllers = viewControllers
        self.startingPage = startingPage

        pageController.dataSource = self

        let startingViewController = viewControllers[startingPage]
        pageController.setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)

        pageController.view.frame = view.bounds
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        pageController.didMoveToParentViewController(self)
    }
}

// MARK: UIPageViewControllerDataSource

extension BasePageViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = viewControllers.indexOf(viewController)

        if let previousIndex = index?.predecessor() where previousIndex >= 0 {
            return viewControllers[previousIndex]
        }

        return nil
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = viewControllers.indexOf(viewController)

        if let nextIndex = index?.successor() where nextIndex < viewControllers.count {
            return viewControllers[nextIndex]
        }

        return nil
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return startingPage
    }
}