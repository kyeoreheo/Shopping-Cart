//
//  TopSellerPVC.swift
//  ShoppingCart
//
//  Created by Kyo on 3/15/21.
//

import UIKit

class TopSellerPVC: UIPageViewController {
    // MARK:- Properties
    private var sellers = [Seller]() {
        didSet { generatePages() }
    }
    
    private var timerHadStarted = false
    private var timer: Timer?
    public lazy var pages = [UIViewController]()

    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        fetchHomeBanners()
        setTimer(every: 4.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK:- Configures
    public func setTimer(every second: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: second, repeats: true) { [weak self]_ in
            guard let strongSelf = self else { return }
            if strongSelf.timerHadStarted {
                strongSelf.loadNextPage()
            }
            strongSelf.timerHadStarted = true
        }
        timer?.fire()
    }

    private func fetchHomeBanners() {
        API.shared.getTopSellers { [weak self] response in
            guard let strongSelf = self,
                  let topSellers = response?.topSellers
            else { return }
            strongSelf.sellers = topSellers
        }
    }
    
    // MARK:- Helpers
    public func generatePages() {
        pages = sellers.compactMap{ TopSellerItem(viewModel: TopSellerVM(seller: $0))}
        if pages.count > 0 {
            setViewControllers([pages[0]], direction: .forward, animated: true)
        }
    }
    
    private func loadNextPage() {
        guard let currentPage = viewControllers?.first,
              let nextPage = pageViewController(self, viewControllerAfter: currentPage)
        else { return }
        setViewControllers([nextPage], direction: .forward, animated: true)
    }
}

// MARK:- Extension
extension TopSellerPVC : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController)
        else { return nil }
        let prevIndex = index - 1
        if prevIndex < 0 { return pages.last }
        return pages[prevIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController)
        else { return nil }
        let nextIndex = index + 1
        if nextIndex > pages.count - 1 { return pages.first }
        return pages[nextIndex]
    }
}
