//
//  ViewController.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import UIKit
import SnapKit

class SplashVC: UIViewController, Coordinating {
    // MARK:- Properties
    var coordinator: Coordinator?
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let logInButton = UIButton()
    private let signUpButton = UIButton()
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobal()
        configureUI()
        view.backgroundColor = .white
    }
    
    // MARK:- Configures
    private func applyGlobal() {
        frameWidth = view.frame.width
        frameHeight = view.frame.height
        ratio = (frameHeight / 812) < 1 ? 1 : (frameHeight / 812)
    }
    
    private func configureUI() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.alpha = 0.8
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        
    }
    // MARK:- Helpers
}

