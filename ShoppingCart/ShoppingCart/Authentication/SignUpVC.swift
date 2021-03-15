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
    private lazy var header = CustomView.shared.header(
                     headerType: .back, target: self, action: #selector(popVC))
    private lazy var usernameTextField = CustomView.shared.textField(
                     placeHolder: "Username", target: self,
                     action: #selector(textFieldDidChange), type: .name)
    private lazy var emailTextField = CustomView.shared.textField(
                     placeHolder: "Email", target: self,
                     action: #selector(textFieldDidChange), type: .email)
    private lazy var mobileTextField = CustomView.shared.textField(
                     placeHolder: "Mobile", target: self,
                     action: #selector(textFieldDidChange), type: .phone)
    private lazy var passwordTextField = CustomView.shared.textField(
                     placeHolder: "Password", target: self,
                     action: #selector(textFieldDidChange), type: .password,
                     buttonAction: #selector(toggleEyeButton))
    private lazy var registerButton = CustomView.shared.generalButton(
                     text: "Register", isActive: false, target: self,
                     action: #selector(registerUser))
    private lazy var popUpModal = CustomView.shared.popUpModal(message: "Successfully Registerd",
                     buttonText: "Confirm", action: #selector(togglePopUP), target: self)
    private let titleLabel = UILabel()
    private let userNameWarningLabel = UILabel()
    private let emailWarningLabel = UILabel()
    private let mobileWarningLabel = UILabel()
    private let passwordWarningLabel = UILabel()

    // MARK:- Properties
    var coordinator: Coordinator?
    private var viewModel: SignUpVM
    private var isPasswodHideen = true
    private var buttonConstraint: NSLayoutConstraint?

    // MARK:- LifeCycles
    init(coordinator: Coordinator?, viewModel: SignUpVM) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        popUpModal.isHidden = true
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        subscribeToShowKeyboardNotifications()
    }

    override func viewDidDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
    }

    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .white
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
        
        view.addSubview(mobileTextField)
        mobileTextField.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }

        view.addSubview(mobileWarningLabel)
        mobileWarningLabel.textColor = .red
        mobileWarningLabel.font = .notoBold(size: 12 * ratio)
        mobileWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(mobileTextField.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(24)
        }

        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.top.equalTo(mobileTextField.snp.bottom).offset(16)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(16)
        }
        
        view.addSubview(popUpModal)
        popUpModal.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

    }
    
    // MARK:- Helper
    func activeButton(button: UIButton, _ isActive: Bool) {
        button.backgroundColor = isActive ? .primary0 : .white
        button.setTitleColor(isActive ? .black : .grey5, for: .normal)
        button.layer.borderColor = UIColor.grey2.cgColor
        button.layer.borderWidth = isActive ? 0 : 2
        button.isEnabled = isActive
    }
    
    // MARK:- Selectors
    @objc func registerUser() {
        userNameWarningLabel.text = viewModel.isVaildUserName ? "" : "Invaild User name"
        emailWarningLabel.text = viewModel.isValidEmail ? "" : "Invalid Email, baddly formatted"
        mobileWarningLabel.text = viewModel.isValidMobile ? "" : "Invalid Password, should longer than 7"
        passwordWarningLabel.text = viewModel.isValidPassword ? "" : "Invalid Password, should longer than 4"
        
        if viewModel.isValidForm {
            API.shared.registerUesr(name: viewModel.fullName,
                                    email: viewModel.email,
                                    mobile: viewModel.mobile,
                                    password: viewModel.password) { [weak self] response in
                guard let strongSelf = self,
                      let response = response
                else { return }
                if response == "SUCCESS" {
                    strongSelf.togglePopUP()
                }
            }
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if textField == usernameTextField.viewWithTag(1) {
            viewModel.fullName = text
            userNameWarningLabel.text = ""
        } else if textField == emailTextField.viewWithTag(1) {
            viewModel.email = text
            emailWarningLabel.text = ""
        } else if textField == passwordTextField.viewWithTag(1) {
            viewModel.password = text
            passwordWarningLabel.text = ""
        } else if textField == mobileTextField.viewWithTag(1) {
            viewModel.mobile = text
            mobileWarningLabel.text = ""
        }
        activeButton(button: registerButton, viewModel.shouldActiveButton)
    }
    
    @objc func togglePopUP() {
        if !popUpModal.isHidden {
            coordinator?.popVC()
        } else {
            popUpModal.isHidden = false
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
