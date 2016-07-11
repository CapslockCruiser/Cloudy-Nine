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

        let landscapeView = LandscapeView.loadFromInterfaceBuilder() as LandscapeView
        landscapeView.frame = landscapeContainerView.bounds
        landscapeContainerView.addSubview(landscapeView)

        setupPageController([
            EmptyViewController.loadFromInterfaceBuilder(),
            ClothingViewController.loadFromInterfaceBuilder(),
            DetailViewController.loadFromInterfaceBuilder()
        ], startingPage: 1)
    }

}