//
//  ShopVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/14/21.
//

import UIKit

class ShopVC: UIViewController {
    // MARK:- View components
    private let titleLabel = UILabel()
//    private let productFeedCVC = ProductFeedCVC()
//    private lazy var notificationView = CustomView().notificationView(text: "Successfully purchased an item!")

    // MARK:- Properties
//    var products = [API.ProductResponse]() {
//        didSet {
//            productFeedCVC.products = products
//        }
//    }
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
        configureView()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureView() {
        view.backgroundColor = .white
//        viewModel.getProducts()
    }
    
    private func configureUI() {
        view.addSubview(titleLabel)
        titleLabel.text = "Trand Items"
        titleLabel.textColor = .grey8
        titleLabel.font = .notoBold(size: 24 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.left.equalToSuperview().offset(24)
        }
        
//        view.addSubview(productFeedCVC.view)
//        productFeedCVC.delegate = self
//        productFeedCVC.view.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(8)
//            make.left.right.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//        }
    }
            
}

// MARK:- Extension

