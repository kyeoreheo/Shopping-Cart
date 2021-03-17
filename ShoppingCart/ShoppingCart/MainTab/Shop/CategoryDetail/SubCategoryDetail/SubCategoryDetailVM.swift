//
//  SubCategoryDetailVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

class SubCategoryDetailVM {
    private let model: Subcategory

    init(model: Subcategory) {
        self.model = model
    }
    
    var title: String {
        model.scname
    }
    
    var description: String {
        model.scdiscription
    }
    
    var id: String {
        model.scid
    }
}
