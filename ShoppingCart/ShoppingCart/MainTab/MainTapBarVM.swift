//
//  MainTapBarVM.swift
//  ShoppingCart
//
//  Created by Kyo on 3/14/21.
//

import UIKit

class MainTabBarVM {
    func barTabView(view: UIViewController, image: String, width: CGFloat = 60, height: CGFloat = 60) -> UINavigationController {
        let tabView = UINavigationController(rootViewController: view)
        tabView.tabBarItem.image = UIImage(named: image)?.scaledDown(into: CGSize(width: width, height: height))
        tabView.navigationBar.isHidden = true
        return tabView
    }
}
