//
//  AnimationTabBarPresentation.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import Foundation

protocol AnimationTabBarPresentation: AnyObject {
  func viewDidAppear()
}

final class AnimationTabBarPresenter {
  private weak var view: AnimationTabBarView?
  private let router: AnimationTabBarWireframe
  private let interactor: AnimationTabBarUsecase

  init(
    view: AnimationTabBarView,
    interactor: AnimationTabBarUsecase,
    router: AnimationTabBarWireframe
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}

extension AnimationTabBarPresenter: AnimationTabBarPresentation {
  func viewDidAppear() {
  }
}
