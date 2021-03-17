//
//  ProductDetailVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/17/21.
//

import UIKit

class ProductDetailVC: UIViewController {
    // MARK:- View components
    private let frame = UIView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let quantityLabel = UIButton()
    private let descriptionLabel = UILabel()
    private let purchaseButton = UIButton()
    
    private let viewModel: ProductVM
    
    // MARK:- Lifecycels
    init(viewModel: ProductVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .clear
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.addSubview(frame)
        frame.clipsToBounds = true
        frame.backgroundColor = .white
        frame.layer.cornerRadius = 20
        frame.snp.makeConstraints { make in
            make.height.equalTo(frameHeight / 2)
            make.left.equalToSuperview().offset(48)
            make.right.equalToSuperview().offset(-48)
            make.center.equalToSuperview()
        }
        
        frame.addSubview(imageView)
        imageView.backgroundColor = .orange
        imageView.sd_setImage(with: URL(string: viewModel.imageStringURL), placeholderImage: UIImage(named: "not-found"))
        imageView.addBlackGradient(frame: imageView.bounds, colors: [.black, .black])
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(150 * ratio)
        }
        
        frame.addSubview(nameLabel)
        nameLabel.text = viewModel.name
        nameLabel.textColor = .grey8
        nameLabel.textAlignment = .left
        nameLabel.font = .boldSystemFont(ofSize: 16 * ratio)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(20)
        }
        
        frame.addSubview(descriptionLabel)
        descriptionLabel.text = viewModel.description
        descriptionLabel.textColor = .grey8
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .notoReg(size: 14 * ratio)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        
        frame.addSubview(priceLabel)
        priceLabel.text = viewModel.price
        priceLabel.textColor = .grey8
        priceLabel.textAlignment = .right
        priceLabel.font = .boldSystemFont(ofSize: 16 * ratio)
        priceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        frame.addSubview(quantityLabel)
        quantityLabel.isUserInteractionEnabled = false
        quantityLabel.backgroundColor = .primary0
        quantityLabel.layer.cornerRadius = 5
        quantityLabel.setTitle(viewModel.quantity, for: . normal)
        quantityLabel.setTitleColor(.black, for: .normal)
        quantityLabel.titleLabel?.font = .boldSystemFont(ofSize: 18 * ratio)
        quantityLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.left.equalTo(priceLabel.snp.right).offset(8)
            make.centerY.equalTo(priceLabel.snp.centerY)
        }
        
        frame.addSubview(purchaseButton)
        let icon = UIImage(named: "cartIcon")?.withRenderingMode(.alwaysTemplate)
        icon?.withTintColor(.black)
        purchaseButton.setImage(icon, for: .normal)
        purchaseButton.addTarget(self, action: #selector(purchaseButtonTapped), for: .touchUpInside)
        purchaseButton.snp.makeConstraints { make in
            make.width.height.equalTo(50 * ratio)
            make.centerY.equalTo(quantityLabel.snp.centerY)
            make.right.equalToSuperview().offset(-12)
        }
    }
    
    @objc func purchaseButtonTapped() {
        dismiss(animated: true)
        print("DEUBG:- tapped")
    }
}
