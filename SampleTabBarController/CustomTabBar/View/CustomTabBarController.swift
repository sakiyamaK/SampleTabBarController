//
//  CustomTabBarView.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

protocol CustomTabBarView: AnyObject {
}

final class CustomTabBarController: UITabBarController {
    
    private var presenter: CustomTabBarPresentation!
    func inject(presenter: CustomTabBarPresentation) {
        self.presenter = presenter
        
        self.setValue(CustomTabBar(), forKey: "tabBar")
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .systemRed
        vc1.tabBarItem.title = "red"
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .systemGreen
        vc2.tabBarItem.title = "green"
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .systemBlue
        vc3.tabBarItem.title = "blue"
        self.setViewControllers([vc1, vc2, vc3], animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard
            let customTabBar = tabBar as? CustomTabBar,
            let selectedIndex = customTabBar.items?.enumerated().filter({ $0.element == item }).first?.offset
        else { return }
        customTabBar.configure(selectedIndex: selectedIndex)
    }
}

extension CustomTabBarController: CustomTabBarView {
}
