//
//  ViewUtils.swift
//  Cloudy Nine
//
//  Created by Michael Pace on 7/11/16.
//  Copyright © 2016 choiw. All rights reserved.
//

import UIKit

protocol LoadableFromInterfaceBuilder: class {
    static func loadFromInterfaceBuilder<T>() -> T
}

extension LoadableFromInterfaceBuilder {
    static func loadFromInterfaceBuilder<T>() -> T {
        let interfaceBuilderDocumentName = String(self)

        if self is UIView.Type {
            let nib = UINib(nibName: interfaceBuilderDocumentName, bundle: nil)

            guard let result = nib.instantiateWithOwner(nil, options: nil).first as? T else {
                fatalError("Error loading nib with name \(interfaceBuilderDocumentName)")
            }

            return result
        } else {
            let storyboard = UIStoryboard(name: interfaceBuilderDocumentName, bundle: nil)

            guard let result = storyboard.instantiateInitialViewController() as? T else {
                fatalError("Error loading storyboard with name \(interfaceBuilderDocumentName)")
            }
            
            return result
        }
    }
}