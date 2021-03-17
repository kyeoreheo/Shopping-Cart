//
//  SubCategoryDetailVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

import UIKit

class SubCategoryDetailVC: UIViewController {
    // MARK:- View components
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private lazy var header = CustomView.shared.header(headerType: .back,
                     target: self, action: #selector(popVC))
    private let productCVC = ProductCVC()

    // MARK:- Properties
    private let cID: String
    private let viewModel: SubCategoryDetailVM
    private var products = [Product]() {
        didSet { productCVC.products = products }
    }
    
    // MARK:- Lifecycles
    init(cID: String, viewModel: SubCategoryDetailVM) {
        self.cID = cID
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureUI()
        fetchSubCategory()
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
        titleLabel.text = viewModel.title//"Category Details"
        titleLabel.textColor = .grey8
        titleLabel.textAlignment = .center
        titleLabel.font = .notoBold(size: 24 * ratio)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.left.right.equalToSuperview()
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.text = viewModel.description
        descriptionLabel.textColor = .grey8
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .notoReg(size: 12 * ratio)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        view.addSubview(productCVC.view)
        productCVC.delegate = self
        productCVC.view.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func fetchSubCategory() {
        API.shared.getProducts(cID: cID, scID: viewModel.id) { [weak self] response in
            guard let strongSelf = self, let response = response
            else { return }
            strongSelf.products = response.products
            
        }
        
//        API.shared.getSubCategory(withID: viewModel.) { [weak self] response in
//            guard let strongSelf = self, let response = response
//            else { return }
//            strongSelf.subCategories = response.subcategory
//            print("DEBUG:- \(response.subcategory)")
//        }
    }
}

// MARK:- Extension
extension SubCategoryDetailVC: ProductCVCDelegate {
    func cellTapped(index: Int) {
        
        let vc = ProductDetailVC(viewModel: ProductVM(model: products[index]))
        vc.modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
//        let qrScanVC = QRSacnVC()
//        qrScanVC.modalPresentationStyle = .popover
//        present(qrScanVC, animated: true, completion: nil)
        print("DEBUG:- cell Tapped \(index)")
    }
    
}

