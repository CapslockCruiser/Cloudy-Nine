//
//  SkyView.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/11/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

@IBDesignable
class SkyView: UIView, LoadableFromInterfaceBuilder, WeatherDrawing {

    // MARK: Public properties

    var weatherViewModel: WeatherViewModel?

    // MARK: UIView

    override func drawRect(rect: CGRect) {
        guard let weatherViewModel = weatherViewModel else {
            return
        }

        let path = UIBezierPath(rect: rect)
        UIColor(red: 0.5, green: 0.3, blue: CGFloat(weatherViewModel.hour) / 24.0, alpha: 1.0).setFill()
        path.fill()
    }

}
