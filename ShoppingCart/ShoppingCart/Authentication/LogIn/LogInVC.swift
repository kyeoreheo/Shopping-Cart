//
//  LogInVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import UIKit

class LogInVC: UIViewController, UIGestureRecognizerDelegate, Coordinating {
    // MARK:- View Components
    private lazy var header = CustomView.shared.header(headerType: .back,
                     target: self, action: #selector(popVC))
    private lazy var mobileTextField = CustomView.shared.textField(
                     placeHolder: "Mobile", target: self,
                     action: #selector(textFieldDidChange), type: .email)
    private lazy var passwordTextField = CustomView.shared.textField(
                     placeHolder: "Password", target: self,
                     action: #selector(textFieldDidChange), type: .password,
                     buttonAction: #selector(toggleEyeButton))
    private lazy var logInButton = CustomView.shared.generalButton(
                     text: "Log In", isActive: false, target: self,
                     action: #selector(logIn))
    private let titleLabel = UILabel()
    private let warningLabel = UILabel()
    private let bottomLabel = UILabel()
    
    // MARK:- Properties
    var coordinator: Coordinator? //<- main nav
    private let viewModel: LogInVM
    private var isPasswodHideen = true
    private var buttonConstraint: NSLayoutConstraint?

    // MARK:- LifeCycles
    init(coordinator: Coordinator?, viewModel: LogInVM) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        coordinator?.fullScreen(MainTabBar(viewModel: MainTabBarVM()), currentView: self, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToShowKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
    }
    
    // MARK:- Configures
    private func configure() {
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
        
        view.addSubview(mobileTextField)
        mobileTextField.snp.makeConstraints { make in
            make.height.equalTo(36 * ratio)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(36 * ratio)
            make.top.equalTo(mobileTextField.snp.bottom).offset(30)
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
    
    // MAKR:- Helper
    func activeButton(button: UIButton, _ isActive: Bool) {
        button.backgroundColor = isActive ? .primary0 : .white
        button.setTitleColor(isActive ? .black : .grey5, for: .normal)
        button.layer.borderColor = UIColor.grey2.cgColor
        button.layer.borderWidth = isActive ? 0 : 2
        button.isEnabled = isActive
    }

    // MARK:- Selectors
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if textField == mobileTextField.viewWithTag(1) {
            viewModel.mobile = text
            warningLabel.text = ""
        } else if textField == passwordTextField.viewWithTag(1) {
            viewModel.password = text
            warningLabel.text = ""
        }
        activeButton(button: logInButton, viewModel.shouldActiveButton)
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
        warningLabel.text = viewModel.isValidForm ? "" : "Invalid mobile or password"

        if viewModel.isValidForm {
            API.shared.logIn(mobile: viewModel.mobile, password: viewModel.password) { [weak self] response in
                guard let strongSelf = self,
                      let response = response?[0]
                else { return }
                strongSelf.coordinator?.fullScreen(MainTabBar(viewModel: MainTabBarVM()), currentView: strongSelf, animated: false)
                User.shared.setUser(model: response)
            }
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
