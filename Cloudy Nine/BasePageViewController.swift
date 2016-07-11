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

    let pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    var viewControllers = [UIViewController]()

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageController()
    }
}

// MARK: Private implementation

private extension BasePageViewController {
    func setupPageController() {
        pageController.dataSource = self

        pageController.setViewControllers(Array(viewControllers.prefix(1)), direction: .Forward, animated: true, completion: nil)

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
        return 0
    }
}