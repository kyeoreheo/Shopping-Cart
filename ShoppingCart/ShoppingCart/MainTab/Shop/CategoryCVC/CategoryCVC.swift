//
//  ProductFeedCVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import UIKit
import SDWebImage

protocol CategoryCVCDelegate: class {
    func cellTapped(index: Int, cId: String)
}

class CategoryCVC: UICollectionViewController {
    // MARK:- Properties
    weak var delegate: CategoryCVCDelegate?
    var categories = [Category]() {
        didSet{ collectionView.reloadData() }
    }
    private let reuseIdentifier = "categoryCell"

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
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK:- Extentions
extension CategoryCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width / 1.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellTapped(index: indexPath.row, cId: categories[indexPath.row].cid)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryCell
        else { return UICollectionViewCell()}
        let viewModel = CategoryCellVM(model: categories[indexPath.row])
        cell.viewModel = viewModel

        return cell
    }
    
}
