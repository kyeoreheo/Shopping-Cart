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
    
    func header(headerType: HeaderType, target: Any, action: Selector) -> UIView {
        let view = UIView()
        let button = UIButton()
        
        view.addSubview(button)
        button.backgroundColor = .blue
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        button.isEnabled = true
        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(24)
        }

        return view
    }
    
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
    
    func notificationView(text: String = "You will recieve delivery status") -> UIView {
        let view = UIView()
        let frame = UIImageView()
        let checkMark = UIImageView()
        let cover = UIImageView()
        let label = UILabel()
        
        view.backgroundColor = .clear
        
        view.addSubview(frame)
        frame.layer.cornerRadius = 8
        frame.backgroundColor = .green
        frame.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        view.addSubview(cover)
        
        view.addSubview(checkMark)
        checkMark.image = UIImage(named: "oval-check-green")
        checkMark.snp.makeConstraints { make in
            make.width.height.equalTo(24 * ratio)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }

        cover.backgroundColor = .white
        cover.layer.cornerRadius = 24 * ratio * 0.7 / 2
        cover.snp.makeConstraints { make in
            make.width.height.equalTo(24 * ratio * 0.7)
            make.center.equalTo(checkMark.snp.center)
        }
        
        view.addSubview(label)
        label.text = text
        label.textColor = .grey0
        label.font = UIFont.notoBold(size: 14 * ratio)
        label.adjustsFontSizeToFitWidth = true
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkMark.snp.right).offset(8)
        }

        return view
    }
    
    func textField(placeHolder: String, target: Any, action: Selector, type: TextFieldType, isSmall: Bool = false, buttonAction: Selector? = nil) -> UIView {
        let view = UIView()
        let textField = UITextField()
        let divider = UIImageView()
        let sideButton = UIButton()
        
        view.addSubview(textField)
        textField.tag = 1
        textField.textColor = .grey8
        if isSmall {
            textField.font = UIFont.notoReg(size: 16 * ratio)
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.grey6, NSAttributedString.Key.font: UIFont.notoReg(size: 16 * ratio)])
        } else {
            textField.font = UIFont.notoBold(size: 24 * ratio)
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.grey6, NSAttributedString.Key.font: UIFont.notoBold(size: 24 * ratio)])
        }
        textField.delegate = target as? UITextFieldDelegate
        textField.addTarget(target, action: action, for: .editingChanged)
        textField.autocorrectionType = .no
        
        switch type {
        case .phone, .card:
            textField.keyboardType = .numberPad
        case .email:
            textField.keyboardType = .emailAddress
        case .password:
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
        case .address, .name:
            textField.keyboardType = .default
        }

        textField.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        view.addSubview(divider)
        divider.contentMode = .scaleAspectFit
        divider.clipsToBounds = true
        divider.isUserInteractionEnabled = true
        divider.backgroundColor = .grey5
        divider.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        if let buttonAction = buttonAction {
            view.addSubview(sideButton)
            sideButton.setImage(UIImage(named: "eyeOn"), for: .normal)
            sideButton.tintColor = .gray
            sideButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
            sideButton.addTarget(target, action: buttonAction, for: .touchUpInside)
            sideButton.snp.makeConstraints { make in
                make.width.height.equalTo(20)
                make.top.equalToSuperview().offset(6)
                make.right.equalToSuperview()
            }
        }

        return view
    }
    
    func informationField(labelText: String, textFieldText: String, action: Selector? = nil, target: Any? = nil) -> UIView {
        let view = UIView()
        let label = UILabel()
        let button = UIButton()
        let frame = UIImageView()
        let textFieldLabel = UILabel()
        
        view.addSubview(label)
        label.text = labelText
        label.font = UIFont.notoReg(size: 14 * ratio)
        label.textColor = .grey8
        label.adjustsFontSizeToFitWidth = true
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        if let action = action, let target = target {
            view.addSubview(button)
            button.setTitle("EDIT", for: .normal)
            button.setTitleColor(.grey4, for: .normal)
            button.titleLabel?.font = UIFont.notoBold(size: 14 * ratio)
            button.layer.borderColor = UIColor.grey4.cgColor
            button.layer.borderWidth = 1.5
            button.layer.cornerRadius = 8
            button.addTarget(target, action: action, for: .touchUpInside)
            button.snp.makeConstraints { make in
                make.width.equalTo(90 * ratio)
                make.height.equalTo(56 * ratio)
                make.top.equalTo(label.snp.bottom).offset(12)
                make.bottom.equalToSuperview()
                make.right.equalToSuperview()
            }
        }
        
        view.addSubview(frame)
        frame.backgroundColor = .grey2
        frame.layer.borderColor = UIColor.grey4.cgColor
        frame.layer.borderWidth = 1.5
        frame.layer.cornerRadius = 8
        frame.snp.makeConstraints { make in
            make.height.equalTo(56 * ratio)
            make.top.equalTo(label.snp.bottom).offset(12)
            make.left.equalToSuperview()
            if action == nil {
                make.right.equalToSuperview()
            } else {
                make.right.equalTo(button.snp.left).offset(-8)
            }
        }
        
        view.addSubview(textFieldLabel)
        textFieldLabel.tag = 1
        textFieldLabel.text = textFieldText
        textFieldLabel.font = UIFont.notoReg(size: 16)
        textFieldLabel.textColor = .grey5
        textFieldLabel.snp.makeConstraints { make in
            make.centerY.equalTo(frame.snp.centerY)
            make.left.equalTo(frame.snp.left).offset(16)
            make.right.equalTo(frame.snp.right).offset(-8)
        }
        return view
    }
    
    
}

