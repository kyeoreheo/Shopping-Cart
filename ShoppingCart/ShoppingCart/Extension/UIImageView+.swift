//
//  UIImageView+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//
import UIKit

extension UIView {
    func addBlackGradient(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.locations = [0.0, 1.0]
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
}
