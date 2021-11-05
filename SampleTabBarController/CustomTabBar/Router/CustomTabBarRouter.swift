//
//  CustomTabBarRouter.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

protocol CustomTabBarWireframe: AnyObject {
}

final class CustomTabBarRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = CustomTabBarController()
        let interactor = CustomTabBarInteractor()
        let router = CustomTabBarRouter(viewController: view)
        let presenter = CustomTabBarPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.inject(presenter: presenter)
        return view
    }
}

extension CustomTabBarRouter: CustomTabBarWireframe {
}
