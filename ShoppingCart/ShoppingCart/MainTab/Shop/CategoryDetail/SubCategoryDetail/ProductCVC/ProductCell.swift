//
//  ProductCell.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    // MARK:- View components
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let quantityLabel = UIButton()
    public let imageView = UIImageView()
    
    // MARK:- Properties
    public var viewModel: ProductVM? {
        didSet { configureView() }
    }

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageView.image = UIImage(named: "not_found")
        nameLabel.text = ""
        quantityLabel.setTitle("", for: .normal)
        priceLabel.text = ""
    }
    
    // MARK:- Configures
    private func configureView() {
        guard let viewModel = viewModel else { return }
        backgroundColor = .grey1
        imageView.sd_setImage(with: URL(string: viewModel.imageStringURL), placeholderImage: UIImage(named: "not-found"))
        nameLabel.text = viewModel.name
        quantityLabel.setTitle(viewModel.quantity, for: .normal)
        priceLabel.text = viewModel.price
    }
    
    private func configureUI() {
        addSubview(imageView)
        imageView.backgroundColor = .grey2
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "not_found")
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(70 * ratio)
        }
        
        addSubview(nameLabel)
        nameLabel.backgroundColor = .blue
        nameLabel.text = "Item name here"
        nameLabel.textColor = .grey8
        nameLabel.textAlignment = .left
        nameLabel.font = .boldSystemFont(ofSize: 30 * ratio)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.left.equalTo(imageView.snp.right).offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(35)
        }
        
        addSubview(quantityLabel)
        quantityLabel.isUserInteractionEnabled = false
        quantityLabel.backgroundColor = .primary0
        quantityLabel.layer.cornerRadius = 5
        quantityLabel.setTitle("quantity here", for: . normal)
        quantityLabel.setTitleColor(.black, for: .normal)
        quantityLabel.titleLabel?.font = .boldSystemFont(ofSize: 14 * ratio)
        quantityLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        addSubview(priceLabel)
        priceLabel.text = "price here"
        priceLabel.textColor = .grey8
        priceLabel.textAlignment = .right
        priceLabel.font = .boldSystemFont(ofSize: 12 * ratio)
        priceLabel.snp.makeConstraints { make in
            make.right.equalTo(quantityLabel.snp.left).offset(-8)
            make.centerY.equalTo(quantityLabel.snp.centerY)
        }
    }
    
    // MARK:- Helpers
    

}

