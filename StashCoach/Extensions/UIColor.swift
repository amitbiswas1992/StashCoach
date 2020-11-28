//
//  UIColor.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//


import Foundation
import UIKit

extension UIColor {
    
    public convenience init(_ value: Int) {
        let components = getColorComponents(value: value)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: 1.0)
    }
}

private func getColorComponents(value: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
    let r = CGFloat(value >> 16 & 0xFF) / 255.0
    let g = CGFloat(value >> 8 & 0xFF) / 255.0
    let b = CGFloat(value & 0xFF) / 255.0
    
    return (r, g, b)
}
