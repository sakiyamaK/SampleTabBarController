//
//  CustomTabBarPresentation.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import Foundation

protocol CustomTabBarPresentation: AnyObject {
  func viewDidAppear()
}

final class CustomTabBarPresenter {
  private weak var view: CustomTabBarView?
  private let router: CustomTabBarWireframe
  private let interactor: CustomTabBarUsecase

  init(
    view: CustomTabBarView,
    interactor: CustomTabBarUsecase,
    router: CustomTabBarWireframe
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}

extension CustomTabBarPresenter: CustomTabBarPresentation {
  func viewDidAppear() {
  }
}
