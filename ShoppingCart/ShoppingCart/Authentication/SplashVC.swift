//
//  ViewController.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import UIKit

class SplashVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    // MARK:- Properties
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobal()
        view.backgroundColor = .orange
    }
    
    // MARK:- Configures
    private func applyGlobal() {
        frameWidth = view.frame.width
        frameHeight = view.frame.height
        ratio = (frameHeight / 812) < 1 ? 1 : (frameHeight / 812)
    }
    // MARK:- Helpers
}

