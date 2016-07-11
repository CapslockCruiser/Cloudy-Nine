//
//  GroundView.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/11/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

@IBDesignable
class GroundView: UIView, LoadableFromInterfaceBuilder, WeatherDrawing {

    // MARK: Public properties

    var weatherViewModel: WeatherViewModel?

    // MARK: UIView

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.greenColor().setFill()
        path.fill()
    }


}
