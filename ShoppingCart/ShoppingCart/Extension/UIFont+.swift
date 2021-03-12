//
//  UIFont+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import UIKit

extension UIFont {
    static func notoThin(size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKkr-Thin", size: size)!
    }
    
    static func notoReg(size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKkr-Regular", size: size)!
    }
    
    static func notoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKkr-Bold", size: size)!
    }
    
    static func hanSanReg(size: CGFloat) -> UIFont {
        return UIFont(name: "BlackHanSans-Regular", size: size)!
    }
}
