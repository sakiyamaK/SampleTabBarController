//
//  RandomRotationTabAnimation.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/03/15.
//

import UIKit

final class RandomRotationTabAnimation: NSObject, UIViewControllerAnimatedTransitioning {

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    0.5
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let from: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
    let to: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
    let container: UIView = transitionContext.containerView
    container.insertSubview(to.view, aboveSubview: from.view)
    let transform = CGAffineTransform.init(rotationAngle: 180.0/180 * CGFloat.pi).concatenating(.init(translationX: -to.view.frame.width, y: -to.view.frame.height)).concatenating(.init(scaleX: 0.2, y: 0.2))
    to.view.transform = transform

    UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                   animations: {() -> Void in
                    to.view.transform = .identity
                    to.view.frame = container.frame
                   },
                   completion: {(value: Bool) in
                    transitionContext.completeTransition(value)
                   })
  }
}
