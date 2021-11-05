//
//  TabBarAppearancePresentation.swift
//  SampleTabBarController
//
//  Created by  on 2021/11/5.
//

import Foundation

protocol TabBarAppearancePresentation: AnyObject {
    func viewDidLoad()
}

final class TabBarAppearancePresenter {
    private weak var view: TabBarAppearanceView?
    private let router: TabBarAppearanceWireframe
    private let interactor: TabBarAppearanceUsecase
    
    init(
        view: TabBarAppearanceView,
        interactor: TabBarAppearanceUsecase,
        router: TabBarAppearanceWireframe
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TabBarAppearancePresenter: TabBarAppearancePresentation {
    func viewDidLoad() {
    }
}
