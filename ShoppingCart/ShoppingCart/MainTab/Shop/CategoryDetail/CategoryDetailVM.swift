//
//  CategoryDetailVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

class CategoryDetailVM {
    private let model: Category

    init(model: Category) {
        self.model = model
    }
    
    var cID: String {
        return model.cid
    }
    
    var title: String {
        return model.cname
    }
    
    var description: String {
        return model.cdiscription
    }
    
    var imageURL: String {
        return model.cimagerl
    }

}
