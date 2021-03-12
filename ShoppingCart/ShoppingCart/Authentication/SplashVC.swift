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
    private lazy var logInButton = CustomView.shared.generalButton(
            text: "Log In", isActive: false, target: self, action: #selector(logInTapped))
    private lazy var signUpButton = CustomView.shared.generalButton(
        text: "Sign Up", target: self, action: #selector(signUpTapped))
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobal()
        configureUI()
        view.backgroundColor = .black
    }
    
    // MARK:- Configures
    private func applyGlobal() {
        frameWidth = view.frame.width
        frameHeight = view.frame.height
        ratio = (frameHeight / 812) < 1 ? 1 : (frameHeight / 812)
        isBigPhone = view.frame.height > 750.0
    }
    
    private func configureUI() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.alpha = 0.6
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        view.addSubview(titleLabel)
        titleLabel.text = "Shopping Cart"
        titleLabel.font = .notoBold(size: 70 * ratio)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100 * ratio)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        view.addSubview(logInButton)
        logInButton.isUserInteractionEnabled = true
        logInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(50 * ratio)
        }
        
        view.addSubview(signUpButton)
        signUpButton.isUserInteractionEnabled = true
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(logInButton.snp.top).offset(-24)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(50 * ratio)
        }
        
    }
    // MARK:- Helpers
    @objc func logInTapped() {
        coordinator?.push(LogInVC(), viewModel: nil)
        print("DEBUG:- logInTapped")
    }
    
    @objc func signUpTapped() {
        print("DEBUG:- signUp Tapped")
    }
}

