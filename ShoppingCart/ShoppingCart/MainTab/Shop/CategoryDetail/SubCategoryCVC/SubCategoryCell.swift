//
//  SubCategoryCell.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

import UIKit

class SubCategoryCell: UICollectionViewCell {
    // MARK:- View components
    public let subCategoryLabel = UILabel()
    public let imageView = UIImageView()
    
    // MARK:- Properties
    public var viewModel: SubCategoryVM? {
        didSet { configureView() }
    }

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //configureView()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configureView() {
        guard let viewModel = viewModel else { return }
//        backgroundColor = .white
        subCategoryLabel.text = viewModel.title
        imageView.sd_setImage(with: URL(string: viewModel.imageStringURL), placeholderImage: UIImage(named: "not-found"))
    }
    
    private func configureUI() {
        addSubview(subCategoryLabel)
        subCategoryLabel.text = "CategoryHere"
        subCategoryLabel.textColor = .grey8
        subCategoryLabel.textAlignment = .center
        subCategoryLabel.font = .boldSystemFont(ofSize: 18 * ratio)
        subCategoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview()
            make.height.equalTo(15)
        }
        
        addSubview(imageView)
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "not_found")
        imageView.snp.makeConstraints { make in
            make.top.equalTo(subCategoryLabel.snp.bottom).offset(4)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK:- Helpers
    override func prepareForReuse() {
//        categoryLabel.text = ""
        imageView.image = UIImage(named: "not_found")
    }

}
