//
//  AuthenticationVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/13/21.
//

import UIKit

protocol AuthenticationVM {
    var isValidForm: Bool { get }
    var shouldActiveButton : Bool { get }
}

class LogInVM: AuthenticationVM, ViewModel {
    var mobile = ""
    var password = ""
    
    var isValidForm: Bool {
        return !mobile.isEmpty && !password.isEmpty
    }
    
    var shouldActiveButton: Bool {
        return !mobile.isEmpty && !password.isEmpty
    }
}

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
        return mobile.count >= 7
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
