//
//  ProductVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

import Foundation

class ProductVM {
    private let model: Product

    init(model: Product) {
        self.model = model
    }
    
    var id: String {
        return model.id
    }
    
    var name: String {
        return model.pname
    }
    
    var quantity: String {
        return model.quantity + " left"
    }
    
    var description: String {
        return model.discription
    }
    
    var price: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return "$" + (numberFormatter.string(from: NSNumber(value: Int(model.prize) ?? 0)) ?? "")
    }
    
    var imageStringURL: String {
        return model.image
    }
    
}
