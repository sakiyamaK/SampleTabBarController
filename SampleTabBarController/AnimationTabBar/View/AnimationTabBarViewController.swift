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
        let vcs: [UIViewController] = Array(0...2).compactMap({ num in
            let vc = UIViewController.createSampleViewController(
                centerLabelText: num.description,
                tabTitleText: num.description
            )
            let value = 0.5 + 0.5 * CGFloat(num) / 2.0
            vc.view.backgroundColor = UIColor.init(white:value, alpha: 1.0)
            return vc
        })
        self.setViewControllers(vcs, animated: true)
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
