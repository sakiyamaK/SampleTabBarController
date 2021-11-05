//
//  TabBarAppearanceRouter.swift
//  SampleTabBarController
//
//  Created by  on 2021/11/5.
//

import UIKit

protocol TabBarAppearanceWireframe: AnyObject {
}

final class TabBarAppearanceRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = UIStoryboard.loadTabBarAppearance()
        let interactor = TabBarAppearanceInteractor()
        let router = TabBarAppearanceRouter(viewController: view)
        let presenter = TabBarAppearancePresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.inject(presenter: presenter)
        return view
    }
}

extension TabBarAppearanceRouter: TabBarAppearanceWireframe {
}

extension UIStoryboard {
    static func loadTabBarAppearance() -> TabBarAppearanceViewController {
        UIStoryboard(name: "TabBarAppearance", bundle: nil).instantiateInitialViewController() as! TabBarAppearanceViewController 
    }
}
