//
//  AppRouter.swift
//  DummyTwitterProfile
//
//  Created by  on 2021/4/29.
//

import UIKit

protocol AppWireframe: AnyObject {
    func showHome()
}

final class AppRouter {
    private let window: UIWindow

    private init(window: UIWindow) {
        self.window = window
    }

    static func assembleModules(window: UIWindow) -> AppPresenter {

        let interactor = AppInteractor()
        let router = AppRouter(window: window)
        let presenter = AppPresenter(
            interactor: interactor,
            router: router
        )
        return presenter
    }
}

extension AppRouter: AppWireframe {
    func showHome() {
        window.rootViewController = HomeRouter.assembleModules().withNavigationController()
        window.makeKeyAndVisible()
    }
}
