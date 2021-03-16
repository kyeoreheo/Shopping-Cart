//
//  CategoryDetailVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

import UIKit

class CategoryDetailVC: UIViewController {
    // MARK:- View components
    private let titleLabel = UILabel()
    private lazy var header = CustomView.shared.header(headerType: .back,
                     target: self, action: #selector(popVC))//    private let topSellerPVC = TopSellerPVC()
    private let subCategoryCVC = SubCategoryCVC()

    // MARK:- Properties
    
    // MARK:- Lifecycles
//    init(viewModel: CategoryDetailVM) {
//
//    }
    
    override func viewDidLoad() {
//        configureView()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.height.equalTo(50 * ratio)
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(titleLabel)
        titleLabel.text = "Category Details"
        titleLabel.textColor = .grey8
        titleLabel.textAlignment = .center
        titleLabel.font = .notoBold(size: 24 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.left.right.equalToSuperview()
        }
        
//        view.addSubview(topSellerPVC.view)
//        topSellerPVC.view.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(8)
//            make.left.right.equalToSuperview()
//            make.height.equalTo(100 * ratio)
//        }
//
//        view.addSubview(categoryCVC.view)
//        categoryCVC.delegate = self
//        categoryCVC.view.snp.makeConstraints { make in
//            make.top.equalTo(topSellerPVC.view.snp.bottom).offset(12)
//            make.left.right.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//        }
    }
            
}

// MARK:- Extension
extension CategoryDetailVC: SubCategoryCVCDelegate {
    func cellTapped(index: Int, cId: String) {
        print("DEBUG:- cell Tapped \(index)")
        API.shared.getSubCategory(withID: cId) { [weak self] response in
        }
    }
    
}
