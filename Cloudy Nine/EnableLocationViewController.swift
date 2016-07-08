//
//  EnableLocationViewController.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/8/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

class EnableLocationViewController: UIViewController {

}

// MARK: Private implementation

private extension EnableLocationViewController {
    @IBAction func enableLocationButtonTapped(sender: AnyObject) {
        guard
            let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate,
            let clothingViewController = UIStoryboard(name: "ClothingViewController", bundle: nil).instantiateInitialViewController() else
        {
            return
        }

        appDelegate.transitionToViewController(clothingViewController)
    }
}