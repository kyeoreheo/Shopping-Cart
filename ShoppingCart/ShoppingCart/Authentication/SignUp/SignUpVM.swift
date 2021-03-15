//
//  SignUpVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import Foundation

class SignUpVM: AuthenticationVM, ViewModel {
    var email = ""
    var fullName = ""
    var password = ""
    var mobile = ""
    
    var isValidForm: Bool {
        return isValidEmail && isValidPassword && isVaildUserName &&  isValidMobile
    }
    
    var isVaildUserName: Bool {
        return !fullName.isEmpty
    }
    
    var isValidPassword: Bool {
        return password.count >= 4
    }
    
    var isValidMobile: Bool {
        return mobile.count >= 10
    }
    
    var isValidEmail: Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", pattern)
        return predicate.evaluate(with: email)
    }
    
    var shouldActiveButton: Bool {
        return !mobile.isEmpty && !password.isEmpty && !fullName.isEmpty && !email.isEmpty
    }
}
