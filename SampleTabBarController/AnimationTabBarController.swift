//
//  AnimationTabBarController.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/03/15.
//

import UIKit

final class AnimationTabBarController: UITabBarController, UITabBarControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
  }

  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print(viewController)
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
