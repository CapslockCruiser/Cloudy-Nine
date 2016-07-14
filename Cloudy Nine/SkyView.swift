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

    // MARK: Private properties

    private let cloudGenerator = CloudGenerator()

    // MARK: UIView

    override func drawRect(rect: CGRect) {
        guard let weatherViewModel = weatherViewModel else {
            return
        }

        // TODO: hit http://sunrise-sunset.org/api to get these values for user's location?
        // TODO: move this stuff into a testable view model?
        let sunriseHour = 7
        let sunsetHour = 21

        var color: UIColor?
        switch weatherViewModel.hour {
        case let h where h < sunriseHour || h > sunsetHour:
            color = UIColor.blackColor()
        default:
            let sunnyDuration = CGFloat(sunsetHour - sunriseHour)
            let currentSunnyPercentage = CGFloat(weatherViewModel.hour - sunriseHour) / sunnyDuration
            let proximityToMidday = abs(currentSunnyPercentage - 0.5)  // 0 is midday, 1.0 is sunrise or sunset
            color = UIColor(red: proximityToMidday, green: 0.3, blue: 1.0 - proximityToMidday, alpha: 1.0)
        }

        let path = UIBezierPath(rect: rect)
        color?.setFill()
        path.fill()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let cloudCount = 3
        for x in 0..<cloudCount {
            let cloud = cloudGenerator.generateCloud(color: UIColor.whiteColor())
            let imageView = UIImageView(image: cloud)
            imageView.frame = CGRect(
                x: CGFloat(x) * (bounds.width / CGFloat(cloudCount)) - (bounds.width / CGFloat(cloudCount)),
                y: CGFloat(randomInt(lower: 0, upper: Int(bounds.size.height) / cloudCount)),
                width: imageView.bounds.width,
                height: imageView.bounds.height)
            addSubview(imageView)
        }
    }

}
