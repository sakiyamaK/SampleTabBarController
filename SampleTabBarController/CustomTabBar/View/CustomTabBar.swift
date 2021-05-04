//
//  CustomTabBar.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/05/04.
//

import UIKit

final class CustomTabBar: UITabBar {
  private var shapeLayer: CALayer?

  override func draw(_ rect: CGRect) {
    self.addShape()
  }
}

private extension CustomTabBar {
  func addShape() {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = createPath(height: 37)
    shapeLayer.strokeColor = UIColor.lightGray.cgColor
    shapeLayer.fillColor = UIColor.white.cgColor
    shapeLayer.lineWidth = 1
    if let oldShapeLayer = self.shapeLayer {
      self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
    } else {
      self.layer.insertSublayer(shapeLayer, at: 0)
    }
  }

  func createPath(height: CGFloat) -> CGPath {
    let path = UIBezierPath()

    let centerWidth = self.frame.midX
    let pointY1 = height * 0.81
    let pointY2 = height * 0.94

    path.move(to: .zero)
    path.addLine(to: .init(x: centerWidth - height * 2, y: 0))

    path.addCurve(to: .init(x: centerWidth, y: -height),
                  controlPoint1: .init(x: centerWidth - pointY1, y: 0),
                  controlPoint2: .init(x: centerWidth - pointY2, y: -height))

    path.addCurve(to: .init(x: centerWidth + height * 2, y: 0),
                  controlPoint1: .init(x: centerWidth + pointY2, y: -height),
                  controlPoint2: .init(x: centerWidth + pointY1, y: 0))

    path.addLine(to: .init(x: self.frame.width, y: 0))
    path.addLine(to: .init(x: self.frame.width, y: self.frame.height))
    path.addLine(to: .init(x: 0, y: self.frame.height))

    path.close()

    return path.cgPath
  }
}
