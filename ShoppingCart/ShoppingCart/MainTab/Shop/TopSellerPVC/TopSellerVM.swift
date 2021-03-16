//
//  TopSellerVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import UIKit
import SDWebImage

class TopSellerVM {
    let id: Int64
    let imageURLString: String
    let coments: [String]
    let rating: Float
    init(seller: Seller) {
        self.id = Int64(seller.id) ?? 0
        self.imageURLString = seller.logoURL
        self.coments = seller.comments.components(separatedBy: ",")
        self.rating = Float(seller.rating) ?? 0.0
    }
}
