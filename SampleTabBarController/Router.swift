//
//  Router.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/03/15.
//

import UIKit

protocol DefaultWireframe {
  func showAlert(error: Error)
}

extension DefaultWireframe {
  func showAlert(error: Error) {
  }
}


final class AppRouter {
  static let shared: AppRouter = .init()
  private init() {}

  private(set) var window: UIWindow?

  func showRoot(window: UIWindow) {
    let tab = AnimationTabBarController()
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .red
    vc1.tabBarItem.title = "red"
    let vc2 = UIViewController()
    vc2.view.backgroundColor = .blue
    vc2.tabBarItem.title = "blue"
    let vc3 = UIViewController()
    vc3.view.backgroundColor = .green
    vc3.tabBarItem.title = "green"
    tab.setViewControllers([vc1, vc2, vc3], animated: true)
    window.rootViewController = tab
    window.makeKeyAndVisible()
    self.window = window
  }


}
