//
//  DrawingUtils.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/12/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

struct BezierPath {
    static func circle(at center: CGPoint, withRadius radius: CGFloat) -> UIBezierPath {
        return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
    }
}