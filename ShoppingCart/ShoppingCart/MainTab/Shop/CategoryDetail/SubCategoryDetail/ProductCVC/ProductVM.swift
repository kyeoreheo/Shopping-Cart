//
//  ProductVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

class ProductVM {
    let id: String
    let name: String
    let quantity: String
    let price: String
    let discription: String
    let imageStringURL: String
    
    init(model: Product) {
        self.id = model.id
        self.name = model.pname
        self.quantity = model.quantity
        self.price = model.prize
        self.discription = model.discription
        self.imageStringURL = model.image
    }
}
