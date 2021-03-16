//
//  UserDefault+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

import Foundation

class Preferences {
    // MARK:- Properties
    static let shared = Preferences()
    private let defaults = UserDefaults.standard

    // MARK:- Lifecycles
    private init() {}
    
    // MARK:- Helpers
    public func setMobile(value: String) {
        defaults.set(value, forKey: "mobile")
    }
    
    public func getMobile() -> String? {
        return defaults.string(forKey: "mobile")
    }
    
    public func setPassword(value: String) {
        defaults.set(value, forKey: "password")
    }
    
    public func getPassword() -> String? {
        return defaults.string(forKey: "password")
    }
    
    public func setUserID(value: String) {
        defaults.set(value, forKey: "userID")
    }
    
    public func getUserID() -> String? {
        return defaults.string(forKey: "userID")
    }
    
    public func setAppAPIKey(value: String) {
        defaults.set(value, forKey: "appAPIKey")
    }
    
    public func getAppAPIKey() -> String? {
        return defaults.string(forKey: "appAPIKey")
    }
}
