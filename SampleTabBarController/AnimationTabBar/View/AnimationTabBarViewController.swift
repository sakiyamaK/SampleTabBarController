//
//  AnimationTabBarView.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

protocol AnimationTabBarView: AnyObject {
}

final class AnimationTabBarController: UITabBarController, UITabBarControllerDelegate {

  private var presenter: AnimationTabBarPresentation!
  func inject(presenter: AnimationTabBarPresentation) {
    self.presenter = presenter
    self.delegate = self
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .red
    vc1.tabBarItem.title = "red"
    let vc2 = UIViewController()
    vc2.view.backgroundColor = .blue
    vc2.tabBarItem.title = "blue"
    let vc3 = UIViewController()
    vc3.view.backgroundColor = .green
    vc3.tabBarItem.title = "green"
    self.setViewControllers([vc1, vc2, vc3], animated: true)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    //TabBarControllerはインスタンス化した直後にviewDidLoadが呼ばれるためここでpresenteのメソッドを呼び出してる
    presenter.viewDidAppear()
  }

  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    DLog(viewController)
  }

  func tabBarController(_ tabBarController: UITabBarController,
                        animationControllerForTransitionFrom fromVC: UIViewController,
                        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let fromIndex = tabBarController.viewControllers?.enumerated().filter{ $0.element == fromVC }.map{ $0.offset }.first ?? 0
    let toIndex = tabBarController.viewControllers?.enumerated().filter{ $0.element == toVC }.map{ $0.offset }.first ?? 0
    let animation = SlideTabAnimation()
    animation.configure(fromIndex: fromIndex, toIndex: toIndex)
    return animation
  }
}

extension AnimationTabBarController: AnimationTabBarView {
}
