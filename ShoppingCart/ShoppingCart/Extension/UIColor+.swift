//
//  UIColor+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//
import UIKit

extension UIColor {
    static let grey0 = UIColor(hexString: "#FFFFFF")
    static let grey1 = UIColor(hexString: "#EBEBEB")
    static let grey2 = UIColor(hexString: "#D8D8D8")
    static let grey3 = UIColor(hexString: "#C5C5C5")
    static let grey4 = UIColor(hexString: "#B2B2B2")
    static let grey5 = UIColor(hexString: "#A0A0A0")
    static let grey6 = UIColor(hexString: "#8E8E8E")
    static let grey7 = UIColor(hexString: "#5D5D5D")
    static let grey8 = UIColor(hexString: "#303030")
    static let grey9 = UIColor(hexString: "#000000")
    
    static let primary0 = UIColor(hexString: "#FF9900")
    static let primary1 = UIColor(hexString: "#FFAA33")
    static let primary2 = UIColor(hexString: "#FF7700")
    
    static let red = UIColor(hexString: "#ff6b6b")
    static let blue = UIColor(hexString: "#339af0")
    static let green = UIColor(hexString: "#51CF66")
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func rgb (_ r: CGFloat, _ g: CGFloat, _ b:CGFloat) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}
