//
//  MainTabBar.swift
//  ShoppingCart
//
//  Created by Kyo on 3/14/21.
//

//shop[], myOrder[], Profile[seting + logout]
import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate, Coordinating {
    // MARK:- Properties
    var coordinator: Coordinator?
    private let viewModel: MainTabBarVM

    // MARK: - Lifecycles
    init(viewModel: MainTabBarVM) {
//        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 0
        
        API.shared.getTopSellers { response in
            print(response)
            
        }
    }
    
    // MARK: - Configures
    private func configureTabBar() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .orange

        let homeTab = viewModel.barTabView(view: ShopVC(), image: "shop")
        let orderTab = viewModel.barTabView(view: MyOrderVC(), image: "order")
        let myPageTab = viewModel.barTabView(view: ProfileVC(), image: "profile")
        
        viewControllers = [homeTab, orderTab, myPageTab]
    }
    
}
