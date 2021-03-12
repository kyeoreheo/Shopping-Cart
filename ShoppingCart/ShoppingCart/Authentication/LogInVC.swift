//
//  LogInVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import UIKit

class LogInVC: UIViewController, UIGestureRecognizerDelegate, Coordinating {
    // MARK:- View Components
    private lazy var header = CustomView.shared.header(headerType: .back, target: self, action: #selector(popVC))
    private lazy var emailTextField = CustomView.shared.textField(placeHolder: "Email", target: self, action: #selector(emailTextFieldDidChange), type: .email)
    private lazy var passwordTextField = CustomView.shared.textField(placeHolder: "Password", target: self, action: #selector(passwordTextFieldDidchange), type: .password, buttonAction: #selector(toggleEyeButton))
    private lazy var logInButton = CustomView.shared.generalButton(text: "Log In", isActive: false, target: self, action: #selector(logIn))
    private let titleLabel = UILabel()
    private let warningLabel = UILabel()
    private let bottomLabel = UILabel()
    
    // MARK:- Properties
    var coordinator: Coordinator? //<- main nav
    private var isPasswodHideen = true
    private var buttonConstraint: NSLayoutConstraint?
    private var email = ""
    private var password = ""

    // MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToShowKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
    }
    
    // MARK:- Configures
    private func configureView() {
        view.backgroundColor = .white
        warningLabel.isHidden = true
    }
    
    private func configureUI() {
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.height.equalTo(50 * ratio)
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(titleLabel)
        titleLabel.text = "Log In"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(36 * ratio)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(36 * ratio)
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        view.addSubview(warningLabel)
        warningLabel.textColor = .red
        warningLabel.font = UIFont.boldSystemFont(ofSize: 12)
        warningLabel.numberOfLines = 0
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        view.addSubview(logInButton)
        buttonConstraint = logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        buttonConstraint?.isActive = true
        logInButton.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }

    // MARK:- Selectors
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        guard let email = textField.text else { return }
        self.email = email
//        viewModel.checkLogInFormat()
    }
    
    @objc func passwordTextFieldDidchange(_ textField: UITextField) {
        guard let password = textField.text else { return }
        self.password = password
//        viewModel.checkLogInFormat()
    }
    
    @objc func toggleEyeButton() {
        guard let button = passwordTextField.subviews[2] as? UIButton,
              let textField = passwordTextField.subviews[0] as? UITextField
        else { return }
        if isPasswodHideen {
            button.setImage(UIImage(named: "eyeOff"), for: .normal)
            textField.isSecureTextEntry = false
            isPasswodHideen = false
        } else {
            button.setImage(UIImage(named: "eyeOn"), for: .normal)
            textField.isSecureTextEntry = true
            isPasswodHideen = true
        }
    }
    
    @objc func logIn() {
        let lowerCaseEmail = email.lowercased()
    }
    
    @objc func presentSignUpVC() {
//        navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    // MARK:- Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        buttonConstraint?.constant = (isBigPhone ? 58 : 32) - keyboardSize.cgRectValue.height - 48
        let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
       
    @objc func keyboardWillHide(_ notification: Notification) {
        buttonConstraint?.constant = 0
        let userInfo = notification.userInfo
        let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    func subscribeToShowKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
}
