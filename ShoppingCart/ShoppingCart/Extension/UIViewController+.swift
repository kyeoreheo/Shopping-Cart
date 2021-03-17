//
//  UIViewController+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/12/21.
//

import UIKit

extension UIViewController {
    @objc func popVC() {
        guard let vc = self as? UIViewController & Coordinating
        else {
            navigationController?.popViewController(animated: true)
            return
        }
        vc.coordinator?.popVC()
    }

}
