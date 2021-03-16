//
//  ProductCell.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//
import UIKit

class CategoryCell: UICollectionViewCell {
    // MARK:- View components
    public let categoryLabel = UILabel()
    public let imageView = UIImageView()
    
    // MARK:- Properties
    private var viewModel: CategoryCellVM?
    public var imageStringURLs = [String]()

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        configureUI()
    }
    
    convenience init(viewModel: CategoryCellVM) {
        self.init()
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configureView() {
        backgroundColor = .white
    }
    
    private func configureUI() {
        addSubview(categoryLabel)
        categoryLabel.text = "CategoryHere"
        categoryLabel.textColor = .grey8
        categoryLabel.textAlignment = .center
        categoryLabel.font = .boldSystemFont(ofSize: 25 * ratio)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview().offset(24)
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
