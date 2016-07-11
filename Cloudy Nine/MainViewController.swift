//
//  MainViewController.swift
//  Cloudy Nine
//
//  Created by William Choi on 7/6/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class MainViewController: BasePageViewController, LoadableFromStoryboard {

    // MARK: UIViewController

    override func viewDidLoad() {
        viewControllers = [
            EmptyViewController.loadFromStoryboard(),
            ClothingViewController.loadFromStoryboard(),
            DetailViewController.loadFromStoryboard()
        ]
    
        super.viewDidLoad()
    }

}