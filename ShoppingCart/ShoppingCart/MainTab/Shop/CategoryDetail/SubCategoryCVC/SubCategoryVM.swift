//
//  SubCategoryVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

class SubCategoryVM {
    let id: String
    let title: String
    let discription: String
    let imageStringURL: String
    init(model: Subcategory) {
        self.id = model.scid
        self.title = model.scname
        self.discription = model.scdiscription
        self.imageStringURL = model.scimageurl
    }
}
