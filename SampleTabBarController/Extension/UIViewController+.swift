//
//  UIViewController;.swift
//  SampleiOSArchitecture
//
//  Created by sakiyamaK on 2021/02/24.
//

import UIKit

extension UIViewController {
  func show(next: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
    DispatchQueue.main.async {
      if let nav = self.navigationController {
        nav.pushViewController(next, animated: animated)
        completion?()
      } else {
        self.present(next, animated: animated, completion: completion)
      }
    }
  }
}

extension UIViewController {
    func withNavigationController() -> UINavigationController {
        .init(rootViewController: self)
    }
}

extension UIViewController {
    static func createSampleViewController(
        centerLabelText: String,
        tabTitleText: String
    ) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let label = UILabel()
        label.text = centerLabelText
        label.textAlignment = .center
        vc.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        vc.tabBarItem.title = tabTitleText
        return vc
    }
}
