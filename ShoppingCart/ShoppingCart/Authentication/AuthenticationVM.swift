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
