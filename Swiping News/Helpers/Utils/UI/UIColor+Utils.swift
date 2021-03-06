//
//  UIColor+Utils.swift
//  Swiping News
//
//  Created by Tiago Oliveira on 17/09/19.
//  Copyright © 2019 Optimize 7. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            alpha: alpha
        )
    }
}

extension UIColor {
    struct AppColors {
        static let primaryColor = UIColor(hex: "DF1E54")
        static let darkPrimaryColor = UIColor(hex: "C51144")
        static let lightPrimaryColor = UIColor(hex: "F8395F")
        static let greyBackgroundColor = UIColor(hex: "EBEBEB")
        
        static let beautifulRedColor = UIColor(hex: "C75C5C")
        static let beautifulDarkRedColor = UIColor(hex: "A55051")
        
        static let beautifulBegeColor = UIColor(hex: "E0E0D1")
        static let beautifulDarkBegeColor = UIColor(hex: "BAB9AE")
        
        static let beautifulDarkBlueColor = UIColor(hex: "4F5D73")
    }
}
