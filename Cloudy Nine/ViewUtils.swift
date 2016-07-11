//
//  ViewUtils.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/11/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

protocol LoadableFromStoryboard: class {
    static func loadFromStoryboard<T>() -> T
}

extension LoadableFromStoryboard {
    static func loadFromStoryboard<T>() -> T {
        let storyboardName = String(self)

        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let result = storyboard.instantiateInitialViewController() as? T else {
            fatalError("Error loading storyboard with name \(storyboardName)")
        }

        return result
    }
}