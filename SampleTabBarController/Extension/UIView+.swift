//
//  UIView+.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/11/05.
//

import UIKit

extension UIView {
    func edgesEquartToSuperView() {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            superview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            superview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
