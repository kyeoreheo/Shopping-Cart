//
//  Model.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

struct TopSellers: Decodable {
    let topSellers: [Seller]

    enum CodingKeys: String, CodingKey {
        case topSellers = "Top sellers"
    }
}

struct Seller: Decodable {
    let id: String
    let name: String
    let comments: String
    let rating: String
    let logoURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "sellername"
        case comments = "sellerdeal"
        case rating = "sellerrating"
        case logoURL = "sellerlogo"
    }
}

struct Category: Decodable {
    
}
