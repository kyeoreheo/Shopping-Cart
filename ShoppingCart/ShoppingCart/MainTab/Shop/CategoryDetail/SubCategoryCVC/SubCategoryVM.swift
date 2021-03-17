//
//  SubCategoryVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

class SubCategoryVM {
    private let model: Subcategory
    init(model: Subcategory) {
        self.model = model
    }
    
    var id: String {
        return model.scid
    }
    var title: String {
        return model.scname
    }
    var description: String {
        return model.scdiscription
    }
    var imageStringURL: String {
        return model.scimageurl
    }
}
