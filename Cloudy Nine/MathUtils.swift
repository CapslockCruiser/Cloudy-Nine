//
//  MathUtils.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/12/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import Foundation

let π = M_PI

func randomInt(lower lower: Int, upper: Int) -> Int {
    assert(lower < upper)
    return lower + Int(arc4random_uniform(UInt32(upper - lower)))
}