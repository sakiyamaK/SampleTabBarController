//
//  AnimationTabBarRouter.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

protocol AnimationTabBarWireframe: AnyObject {
}

final class AnimationTabBarRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> UIViewController {
        let view = AnimationTabBarController()
        let interactor = AnimationTabBarInteractor()
        let router = AnimationTabBarRouter(viewController: view)
        let presenter = AnimationTabBarPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.inject(presenter: presenter)
        return view
    }
}

extension AnimationTabBarRouter: AnimationTabBarWireframe {
}
