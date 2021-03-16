//
//  ProductCell.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//
import UIKit

//protocol CategoryCellDelegate: class {
//    func purchasedButtonTapped(completion: @escaping(Bool?) -> Void)
//}

class CategoryCell: UICollectionViewCell {
    // MARK:- View components
//    public let productImagePVC = ProductImagePVC()
    public let categoryLabel = UILabel()
    public let imageView = UIImageView()
//    public let popUpMerchantLabel = UILabel()
//    public let popUpCreatedDateLabel = UILabel()
//    public let popUpWebsiteButton = UIButton()
//    private let detailButton = UIButton()
//    private let visualEffectView = UIVisualEffectView()
//    private let popUpFrame = UIView()
//    private let popUpProductName = UILabel()
//    private let purchaseButton = UIButton()
    
    // MARK:- Properties
//    weak var delegate: ProductCellDelegate?
    private var viewModel: CategoryCellVM?
    public var imageStringURLs = [String]()
//    public var webSiteURL = ""
//    private var isDetailOn = false
//    public var product: API.ProductResponse?

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
//        visualEffectView.alpha = 0
//        popUpFrame.alpha = 0
//        isDetailOn = false
    }
    
    private func configureUI() {
        addSubview(categoryLabel)
        categoryLabel.text = "CategoryHere"
        categoryLabel.textColor = .grey8
        categoryLabel.font = .boldSystemFont(ofSize: 12 * ratio)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(15)
        }
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "not_found")
        imageView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK:- Helpers
    override func prepareForReuse() {

    }
    
    // MARK:- Selectors
    
    
}
