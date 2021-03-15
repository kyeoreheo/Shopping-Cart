//
//  LogInVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

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
