//
//  CategoryVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import UIKit

class CategoryCellVM {
    let title: String
    let imageStringURL: String
    let id: String
    
    init(model: Category) {
        self.id = model.cid
        self.title = model.cname
        self.imageStringURL = model.cimagerl
    }
    
}

