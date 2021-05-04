//
//  TabAnimation.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/03/15.
//

import UIKit

final class FadeTabAnimation: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    1.0
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let from: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
    let to: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
    let container: UIView = transitionContext.containerView
    container.insertSubview(to.view, aboveSubview: from.view)
    to.view.alpha = 0.0
    
    UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                   animations: {() -> Void in
                    from.view.alpha = 0.0
                    to.view.alpha = 1.0
                   },
                   completion: {(value: Bool) in
                    transitionContext.completeTransition(value)
                   })
  }
}
