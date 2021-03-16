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

struct LogInResponse: Decodable {
    let mobile: String
    let id: String
    let lastname: String
    let firstname: String
    let msg: String
    let email: String
    let appapikey: String
    
    enum CodingKeys: String, CodingKey {
        case msg, id, firstname, lastname, email, mobile
        case appapikey = "appapikey "
    }
}

struct CategoryResponse: Decodable {
    let category: [Category]
}

struct Category: Decodable {
    let cid: String
    let cname: String
    let cdiscription: String
    let cimagerl: String
}

struct SubCategryResponse: Codable {
    let subcategory: [Subcategory]
}

struct Subcategory: Codable {
    let scid: String
    let scname: String
    let scdiscription: String
    let scimageurl: String
}
