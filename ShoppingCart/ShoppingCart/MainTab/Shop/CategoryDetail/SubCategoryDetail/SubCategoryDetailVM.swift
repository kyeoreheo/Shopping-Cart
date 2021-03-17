//
//  SubCategoryDetailVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

class SubCategoryDetailVM {
    let title: String
    let description: String
    let id: String
    init(model: Subcategory) {
        self.title = model.scname
        self.description = model.scdiscription
        self.id = model.scid
    }
}
