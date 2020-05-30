//
//  UIButton+Extensions.swift
//  Trivia App
//
//  Created by Venkat on 29/05/20.
// Copyright @ 2020 Venkat. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    /// rounds corner on button
    /// - Parameter radius: size of the rounded corner
    
    func uiButtonCornerRadius(radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
