//
//  SubCategoryCell.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//

import UIKit

class SubCategoryCell: UICollectionViewCell {
    // MARK:- View components
    public let categoryLabel = UILabel()
    public let imageView = UIImageView()
    
    // MARK:- Properties
    public var viewModel: CategoryCellVM? {
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
        backgroundColor = .white
        categoryLabel.text = viewModel.title
        imageView.sd_setImage(with: URL(string: viewModel.imageStringURL), placeholderImage: UIImage(named: "not-found"))
    }
    
    private func configureUI() {
        addSubview(categoryLabel)
        categoryLabel.text = "CategoryHere"
        categoryLabel.textColor = .grey8
        categoryLabel.textAlignment = .center
        categoryLabel.font = .boldSystemFont(ofSize: 25 * ratio)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        addSubview(imageView)
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "not_found")
        imageView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(4)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK:- Helpers
    override func prepareForReuse() {
        categoryLabel.text = ""
        imageView.image = UIImage(named: "not_found")
    }

}
