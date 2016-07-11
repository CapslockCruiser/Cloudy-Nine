//
//  LandscapeView.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/11/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

@IBDesignable
class LandscapeView: UIView, LoadableFromInterfaceBuilder, WeatherDrawing {

    // MARK: Private properties

    @IBOutlet weak var skyView: SkyView!
    @IBOutlet weak var groundView: GroundView!


    // MARK: Public properties

    var weatherViewModel: WeatherViewModel? {
        didSet {
            skyView.weatherViewModel = weatherViewModel
            groundView.weatherViewModel = weatherViewModel
        }
    }

}
