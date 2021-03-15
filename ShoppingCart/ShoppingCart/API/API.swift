//
//  API.swift
//  ShoppingCart
//
//  Created by Kyo on 3/13/21.
//

import Foundation
import Alamofire

class API {
    static let shared = API()
    private init() { }
    
    let baseURL = "http://rjtmobile.com/aamir/e-commerce/ios-app/"
    let register = "shop_reg.php?"
    let logIn = "shop_login.php?"
    let forget = "forgot_pass_email.php?"
    let editProfile = "edit_profile.php?"
    let resetPassword = "shop_reset_pass.php?"
    let topSeller = "shop_top_sellers.php?" //get
    let category = "cust_category.php?"
    let subCategory = "cust_sub_category.php?"
    let product = "product_details.php?"

}
