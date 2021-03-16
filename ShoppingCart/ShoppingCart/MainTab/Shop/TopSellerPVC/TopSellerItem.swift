//
//  TopSellerItem.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import UIKit

class TopSellerItem: UIViewController  {
    // MARK:- Properties
    private var viewModel: TopSellerVM?
    var image: UIImage? {
        didSet { bannerImage.image = image }
    }
    
    private var bannerImage = UIImageView()

    // MARK:- Lifecycle
    convenience init(viewModel: TopSellerVM) {
        self.init(nibName:nil, bundle:nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setBannerImage()
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.addSubview(bannerImage)
        view.backgroundColor = .gray
        bannerImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    public func setBannerImage() {
        guard let viewModel = viewModel,
              let imageURL = URL(string: viewModel.imageURLString)
        else { return }
        bannerImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "not_found"))
        bannerImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPromotion)))
    }
    
    // MARK:- Selectors
    @objc
    private func openPromotion(_: UITapGestureRecognizer) {
//        guard let url = URL(string: banner?.link ?? "") else { return }
//        UIApplication.shared.open(url)
        //WeatlyAnalytics.shared.sendReport(component: .배너카드, target: banner?.title ?? "")
    }
}
