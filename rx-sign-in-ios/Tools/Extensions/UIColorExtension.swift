//
//  UIColorExtension.swift
//  Tools
//
//  Created by Rishat Yakushev on 01.01.2018.
//  Copyright © 2018 Flatstack. All rights reserved.
//

import UIKit

public extension UIColor {

    // MARK: - Initializers

    public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    public convenience init(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alphaByte: UInt8) {
        self.init(red: CGFloat(redByte) / 255.0,
                  green: CGFloat(greenByte) / 255.0,
                  blue: CGFloat(blueByte) / 255.0,
                  alpha: CGFloat(alphaByte) / 255.0)
    }

    public convenience init(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(redByte) / 255.0,
                  green: CGFloat(greenByte) / 255.0,
                  blue: CGFloat(blueByte) / 255.0,
                  alpha: alpha)
    }

    public convenience init(white: CGFloat) {
        self.init(white: white, alpha: 1.0)
    }

    public convenience init(whiteByte: UInt, alphaByte: UInt8) {
        self.init(white: CGFloat(whiteByte) / 255.0, alpha: CGFloat(alphaByte) / 255.0)
    }

    public convenience init(whiteByte: UInt, alpha: CGFloat = 1.0) {
        self.init(white: CGFloat(whiteByte) / 255.0, alpha: alpha)
    }

    public convenience init(withRGBHex hex: UInt32) {
        self.init(redByte: UInt8((hex >> 16) & 255),
                  greenByte: UInt8((hex >> 8) & 255),
                  blueByte: UInt8(hex & 255))
    }

    // MARK: - Instance Properties

    public var hexString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return "#000000"
        }

        if alpha < 1.0 {
            return String(format: "#%02lX%02lX%02lX%02lX", Int(red * 255.0), Int(green * 255.0), Int(blue * 255.0), Int(alpha * 255.0))
        } else {
            return String(format: "#%02lX%02lX%02lX", Int(red * 255.0), Int(green * 255.0), Int(blue * 255.0))
        }
    }
}
