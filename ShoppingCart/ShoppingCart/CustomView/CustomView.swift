//
//  CustomView.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import UIKit

class CustomView {
    static let shared = CustomView()
    private init() { }
    
    func generalButton(text: String,
                       buttonColor: UIColor = .primary0,
                       textColor: UIColor = .black,
                       isActive: Bool = true,
                       target: Any, action: Selector) -> UIButton {
        let button = UIButton(type: .system)

        button.backgroundColor = isActive ? buttonColor : .white
        button.setTitleColor(isActive ? textColor : .grey5, for: .normal)
        button.layer.borderColor = UIColor.grey2.cgColor
        button.layer.borderWidth = isActive ? 0 : 2
        button.layer.cornerRadius = 5
        button.setTitle(text, for:.normal)
        button.titleLabel?.font = UIFont.notoBold(size: 14 * ratio)
        button.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        //button.isEnabled = isActive

        return button
    }
}
