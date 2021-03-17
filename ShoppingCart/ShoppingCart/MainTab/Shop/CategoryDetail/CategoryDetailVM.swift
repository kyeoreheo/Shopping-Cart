//
//  CategoryDetailVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

class CategoryDetailVM {
    let cID: String
    let title: String
    let discription: String
    let imageURL: String
    init(model: Category) {
        self.cID = model.cid
        self.title = model.cname
        self.discription = model.cdiscription
        self.imageURL = model.cimagerl
    }
//    init(model: Ca)
}
