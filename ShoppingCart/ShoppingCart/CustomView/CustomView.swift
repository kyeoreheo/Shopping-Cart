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
    
    func generalButton(isActive: Bool, text: String = "text here",
                       buttonColor: UIColor = .primary0,
                       textColor: UIColor = .black,
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
        button.isEnabled = isActive

        return button
    }
}
