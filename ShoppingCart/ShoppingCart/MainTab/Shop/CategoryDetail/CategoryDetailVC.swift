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
    private let descriptionLabel = UILabel()
    private lazy var header = CustomView.shared.header(headerType: .back,
                     target: self, action: #selector(popVC))
    private let subCategoryCVC = SubCategoryCVC()

    // MARK:- Properties
    private let viewModel: CategoryDetailVM
    private var subCategories = [Subcategory]() {
        didSet { subCategoryCVC.subCategories = subCategories }
    }
    
    // MARK:- Lifecycles
    init(viewModel: CategoryDetailVM) {
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
        
        view.addSubview(subCategoryCVC.view)
        subCategoryCVC.delegate = self
        subCategoryCVC.view.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func fetchSubCategory() {
        API.shared.getSubCategory(withID: viewModel.cID) { [weak self] response in
            guard let strongSelf = self, let response = response
            else { return }
            strongSelf.subCategories = response.subcategory
            print("DEBUG:- \(response.subcategory)")
        }
    }
}

// MARK:- Extension
extension CategoryDetailVC: SubCategoryCVCDelegate {
    func cellTapped(index: Int) {
        navigationController?.pushViewController(SubCategoryDetailVC(cID: viewModel.cID, viewModel: SubCategoryDetailVM(model: subCategories[index])), animated: true)
        print("DEBUG:- cell Tapped \(index)")
    }
    
}
