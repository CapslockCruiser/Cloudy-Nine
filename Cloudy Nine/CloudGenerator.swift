//
//  CloudGenerator.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/12/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

struct CloudGenerator {
    func generateCloud(color color: UIColor) -> UIImage {
        let xCoefficient = Double(randomInt(lower: 70, upper: 100))
        let yCoefficient = Double(randomInt(lower: 10, upper: 35))
        let numberOfSubCircles: Double = 12

        // calculate points around the base ellipse of our cloud
        let ellipsePoints: [CGPoint] = (0.0)
            .stride(to: 1.0, by: 1 / numberOfSubCircles)
            .map { value in
                CGPoint(
                    x: xCoefficient * cos(2 * π * value),  // TODO: explain why cos and sin
                    y: yCoefficient * sin(2 * π * value))
        }

        // create the base ellipse of our cloud
        let path = UIBezierPath()
        path.moveToPoint(ellipsePoints[0])
        ellipsePoints[1..<ellipsePoints.count].forEach{ path.addLineToPoint($0) }
        path.closePath()

        // create subcircles along the base ellipse
        let minSubCircleRadius = (Int)(π * xCoefficient / numberOfSubCircles)  // TODO: explain why this for min?
        let maxSubCircleRadius = minSubCircleRadius + 25
        ellipsePoints[1..<ellipsePoints.count].forEach{ point in
            let randomRadius = CGFloat(randomInt(lower: minSubCircleRadius, upper: maxSubCircleRadius))
            path.appendPath(
                BezierPath.circle(at: point, withRadius: randomRadius)
            )
        }

        // translate the cloud's path down to the center of the canvas
        let outerMargin = CGFloat(20)
        path.applyTransform(CGAffineTransformMakeTranslation(
            path.bounds.width / 2 + outerMargin / 2,
            path.bounds.height / 2 + outerMargin / 2
        ))

        // actually draw the cloud and convert to image
        UIGraphicsBeginImageContext(CGSizeMake(path.bounds.width + outerMargin, path.bounds.height + outerMargin))
        color.setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}