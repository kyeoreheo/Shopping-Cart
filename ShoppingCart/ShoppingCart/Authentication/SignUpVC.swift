//
//  SignUpVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/12/21.
//

import UIKit
import SnapKit

class SignUpVC: UIViewController, UIGestureRecognizerDelegate, Coordinating {
    // MARK:- View components
    private lazy var header = CustomView.shared.header(headerType: .back, target: self, action: #selector(popVC))
    private let titleLabel = UILabel()
    private lazy var usernameTextField = CustomView.shared.textField(
        placeHolder: "Username", target: self, action: #selector(textFieldDidChange), type: .name)
    private lazy var emailTextField = CustomView.shared.textField(
        placeHolder: "Email", target: self, action: #selector(textFieldDidChange), type: .email)
    private lazy var passwordTextField = CustomView.shared.textField(
        placeHolder: "Password", target: self, action: #selector(textFieldDidChange), type: .password, buttonAction: #selector(toggleEyeButton))
    private lazy var registerButton = CustomView.shared.generalButton(
        text: "Register", isActive: true, target: self, action: #selector(registerUser))
    private let userNameWarningLabel = UILabel()
    private let emailWarningLabel = UILabel()
    private let passwordWarningLabel = UILabel()

    
    // MARK:- Properties
    var coordinator: Coordinator?
    private var isPasswodHideen = true
    private var buttonConstraint: NSLayoutConstraint?
    private var email = ""
    private var password = ""
    private var username = ""

    // MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        subscribeToShowKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
    }
    
    // MARK:- Configures
    private func configure() {
        view.backgroundColor = .white
        //warningLabel.isHidden = true
    }
    
    private func configureUI() {
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.height.equalTo(50 * ratio)
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(titleLabel)
        titleLabel.text = "Sign Up"
        titleLabel.textColor = .grey8
        titleLabel.font = .notoBold(size: 36 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        view.addSubview(userNameWarningLabel)
        userNameWarningLabel.textColor = .red
        userNameWarningLabel.font = .notoBold(size: 12 * ratio)
        userNameWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.top.equalTo(usernameTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        view.addSubview(emailWarningLabel)
        emailWarningLabel.textColor = .red
        emailWarningLabel.font = .notoBold(size: 12 * ratio)
        emailWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        view.addSubview(passwordWarningLabel)
        passwordWarningLabel.textColor = .red
        passwordWarningLabel.font = .notoBold(size: 12 * ratio)
        passwordWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(24)
        }
      
        
        view.addSubview(registerButton)
        buttonConstraint = registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        buttonConstraint?.isActive = true
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", pattern)
        return predicate.evaluate(with: email)
    }
    
    // MARK:- Selectors
    @objc func registerUser() {
        userNameWarningLabel.text = username.count > 0 ? "" : "Invaild User name"
        emailWarningLabel.text = isValidEmail(email) ? "" : "Invalid Email"
        passwordWarningLabel.text = (Int(password) ?? 0 >= 8) ? "" : "Invalid Password"
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if textField == usernameTextField.viewWithTag(1) {
            username = text
            userNameWarningLabel.text = ""
        } else if textField == emailTextField.viewWithTag(1) {
            email = text
            emailWarningLabel.text = ""
        } else if textField == passwordTextField.viewWithTag(1) {
            password = text
            passwordWarningLabel.text = ""
        }
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
    
    // MARK:- Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        buttonConstraint?.constant = (isBigPhone ? 50 + 8 : 16 + 16) - keyboardSize.cgRectValue.height - 48
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
