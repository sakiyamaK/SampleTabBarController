//
//  TabBarAppearanceView.swift
//  SampleTabBarController
//
//  Created by  on 2021/11/5.
//

import UIKit

extension UITabBarItem {
    func switchBadge(isHidden: Bool) {
        setBadgeTextAttributes([.foregroundColor: UIColor.red], for: .normal)
        badgeColor = .black
        badgeValue = isHidden ? nil : "•"
    }
}

protocol TabBarAppearanceView: AnyObject {
}

final class TabBarAppearanceViewController: UITabBarController {
    
    private var presenter: TabBarAppearancePresentation!
    func inject(presenter: TabBarAppearancePresentation) {
        self.presenter = presenter
        
        if #available(iOS 15.0, *) {
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .clear
            appearance.stackedLayoutAppearance.normal.badgeTextAttributes = [.foregroundColor: UIColor.red]
            
            let tabBarAppearance = UITabBar.appearance()
            tabBarAppearance.standardAppearance = appearance
            tabBarAppearance.scrollEdgeAppearance = appearance
            
            tabBarAppearance.tintColor = .black
        }
        
        let vcs: [UIViewController] = Array(1...4).compactMap({ num in
            UIViewController.createSampleViewController(
                centerLabelText: num.description,
                tabTitleText: num.description
            )
        })
        
        self.setViewControllers(vcs, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.viewControllers?.first?.tabBarItem.switchBadge(isHidden: false)
    }
}

extension TabBarAppearanceViewController: TabBarAppearanceView {
}
