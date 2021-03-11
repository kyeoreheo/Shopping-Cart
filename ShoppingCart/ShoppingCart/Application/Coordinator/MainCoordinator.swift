//
//  MainCoordinator.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func push(_ viewController: Coordinating & UIViewController) {
        var vc = viewController
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fullScreen(_ viewController: Coordinating & UIViewController, currentView: Coordinating & UIViewController) {
        
        var vc = viewController
        vc.coordinator = self

        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let nav = UINavigationController(rootViewController: vc)
            strongSelf.navigationController = nav
            nav.modalPresentationStyle = .fullScreen
            nav.navigationBar.isHidden = true
            currentView.present(nav, animated: false)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = SplashVC()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
