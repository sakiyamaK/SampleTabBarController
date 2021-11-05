//
//  HomeRouter.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

protocol HomeWireframe: AnyObject {
    func showAnimationTabBar()
    func showCustomTabBar()
    func showTabBarAppearance()
}

final class HomeRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.inject(presenter: presenter)
        return view
    }
}

extension HomeRouter: HomeWireframe {
    func showAnimationTabBar() {
        let vc = AnimationTabBarRouter.assembleModules()
        viewController.show(next: vc)
    }
    
    func showCustomTabBar() {
        let vc = CustomTabBarRouter.assembleModules()
        viewController.show(next: vc)
    }
    
    func showTabBarAppearance() {
        let vc = TabBarAppearanceRouter.assembleModules()
        viewController.show(next: vc)
    }
}
