//
//  Coordinator.swift
//  ShoppingCart
//
//  Created by Kyo on 3/11/21.
//

import Foundation
import UIKit

enum Transaction {
    case push
    case pop
    case fullScreen
    case overCurrentContext
    case modalPresent
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func popVC()
    func push(_ viewController: Coordinating & UIViewController, viewModel: ViewModel?)
    func fullScreen(_ viewController: Coordinating & UIViewController, currentView: Coordinating & UIViewController, viewModel: ViewModel?)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

protocol ViewModel {
    
}
