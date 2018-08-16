//
//  Exts.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension UIColor {
    static func hex (_ hexString: String) -> UIColor {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static var random: UIColor {
        get {
            let red = CGFloat(arc4random_uniform(255)) / 255.0
            let green = CGFloat(arc4random_uniform(255)) / 255.0
            let blue = CGFloat(arc4random_uniform(255)) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

extension UIFont {
    static func pingFang(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFang SC", size: size)!
    }
    
    static func pingFangLight(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: size)!
    }
    
    static func pingFangThin(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Thin", size: size)!
    }
    
    static func pingFangMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size)!
    }
}

extension UIImage {
    func resize(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: newSize.width, height: newSize.height))
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
}

extension Date {
    static func createBy(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components)!
    }
    
    func dayStr() ->  String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    func monthDayStr() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM月dd日"
        return dateFormatter.string(from: self)
    }
}
