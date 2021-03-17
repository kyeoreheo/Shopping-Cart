//
//  SubCategoryCVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/16/21.
//
import UIKit

protocol SubCategoryCVCDelegate: class {
    func cellTapped(index: Int)
}

class SubCategoryCVC: UICollectionViewController {
    // MARK:- Properties
    weak var delegate: SubCategoryCVCDelegate?
    private let reuseIdentifier = "subCategoryCell"
    public var subCategories = [Subcategory]() {
        didSet{ collectionView.reloadData() }
    }

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
        collectionView.register(SubCategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

}

// MARK:- Extentions
extension SubCategoryCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width / 1.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellTapped(index: indexPath.row)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SubCategoryCell
        else { return UICollectionViewCell()}
        let viewModel = SubCategoryVM(model: subCategories[indexPath.row])
        cell.viewModel = viewModel

        return cell
    }
    
}
