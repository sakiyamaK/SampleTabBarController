//
//  SlideTabAnimation.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/03/15.
//

import UIKit

final class SlideTabAnimation: NSObject, UIViewControllerAnimatedTransitioning {

  enum Direction {
    case none, toLeft, toRight
  }

  private var direction: Direction = .none

  func configure(fromIndex: Int, toIndex: Int) {
    self.direction = toIndex > fromIndex ? .toRight : .toLeft
  }

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    0.25
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard direction != .none else { return }
    
    let from: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
    let to: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
    let container: UIView = transitionContext.containerView
    container.insertSubview(to.view, aboveSubview: from.view)
    to.view.alpha = 0.3
    switch direction {
    case .toLeft:
      to.view.frame = to.view.frame.offsetBy(dx: -to.view.frame.width, dy: 0)
    default:
      to.view.frame = to.view.frame.offsetBy(dx: to.view.frame.width, dy: 0)
    }

    UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                   animations: {() -> Void in
                    to.view.frame = container.frame
                    to.view.alpha = 1.0
                    switch self.direction {
                    case .toLeft:
                      from.view.frame = from.view.frame.offsetBy(dx: from.view.frame.width, dy: 0)
                    default:
                      from.view.frame = from.view.frame.offsetBy(dx: -from.view.frame.width, dy: 0)
                    }

                   },
                   completion: {(value: Bool) in
                    transitionContext.completeTransition(value)
                   })
  }
}
