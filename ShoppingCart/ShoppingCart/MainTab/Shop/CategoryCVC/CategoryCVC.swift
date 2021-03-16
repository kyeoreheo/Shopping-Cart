//
//  ProductFeedCVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import UIKit

class CategoryCVC: UICollectionViewController {
    // MARK:- Properties
//    weak var delegate: ProductCellDelegate?
    private let reuseIdentifier = "categoryCell"
//    public var products = [API.ProductResponse]() {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
    
    // MARK:- Lifecycles
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .vertical
        myLayout.minimumLineSpacing = 16
        super.init(collectionViewLayout: myLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK:- Configures
    private func configure() {
        collectionView.backgroundColor = .orange
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK:- Extentions
extension CategoryCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.width / 2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryCell
        else { return UICollectionViewCell()}
        //
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCell
//
//        let currentItem = products[indexPath.row]
//        cell.viewModel.filterValues(productName: currentItem.title,
//             imageStringURLs: currentItem.images,
//             merchant: currentItem.merchant,
//             createdAt: currentItem.createdAt,
//             websiteURL: currentItem.url)
//        cell.delegate = delegate
//        cell.product = products[indexPath.row]

        return cell
    }
    
}
