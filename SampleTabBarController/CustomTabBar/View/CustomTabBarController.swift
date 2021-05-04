//
//  CustomTabBarView.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

protocol CustomTabBarView: AnyObject {
}

final class CustomTabBarController: UITabBarController {

  private var presenter: CustomTabBarPresentation!
  func inject(presenter: CustomTabBarPresentation) {
    self.presenter = presenter
    let tabBar = CustomTabBar()
    tabBar.delegate = self
    self.setValue(tabBar, forKey: "tabBar")
    
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .red
    vc1.tabBarItem.title = "red"
    let vc2 = UIViewController()
    vc2.view.backgroundColor = .blue
    vc2.tabBarItem.title = "blue"
    self.setViewControllers([vc1, vc2], animated: true)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter.viewDidAppear()
  }
}

extension CustomTabBarController: CustomTabBarView {
}
