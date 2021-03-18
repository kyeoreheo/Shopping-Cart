//
//  User.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

class User {
    // MARK:- Properties
    static let shared = User()
    private(set) var model = LogInResponse(mobile: "", id: "", lastname: "", firstname: "", msg: "", email: "", appapikey: "")
    private(set) var orders = [Product]()
    
    // MARK:- Lifecycles
    private init() {}
    
    public func setUser(model: LogInResponse) {
        self.model = model
        Preferences.shared.setMobile(value: model.mobile)
        Preferences.shared.setUserID(value: model.id)
        Preferences.shared.setAppAPIKey(value: model.appapikey)
    }
    
    public func addProduct(_ product: Product) {
        orders.append(product)
    }
}
