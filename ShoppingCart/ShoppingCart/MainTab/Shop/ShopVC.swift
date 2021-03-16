//
//  ShopVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/14/21.
//

import UIKit

class ShopVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    // MARK:- View components
    private let titleLabel = UILabel()
    private let topSellerPVC = TopSellerPVC()
    private let categoryCVC = CategoryCVC()

    // MARK:- Properties
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
//        configureView()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.text = "Trand Items"
        titleLabel.textColor = .grey8
        titleLabel.font = .notoBold(size: 24 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.left.equalToSuperview().offset(24)
        }
        
        view.addSubview(topSellerPVC.view)
        topSellerPVC.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(100 * ratio)
        }
        
        view.addSubview(categoryCVC.view)
        categoryCVC.delegate = self
        categoryCVC.view.snp.makeConstraints { make in
            make.top.equalTo(topSellerPVC.view.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
            
}

// MARK:- Extension
extension ShopVC: CategoryCVCDelegate {
    func cellTapped(index: Int, cId: String) {
        print("DEBUG:- cell Tapped \(index)")
        API.shared.getSubCategory(withID: cId) { [weak self] response in
            guard let strongSelf = self, let response = response
            else { return }
            strongSelf.navigationController?.pushViewController(CategoryDetailVC(), animated: true)
//            strongSelf.coor
        }
    }
    
}
