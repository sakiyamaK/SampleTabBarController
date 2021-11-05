//
//  CustomTabBar.swift
//  SampleTabBarController
//
//  Created by sakiyamaK on 2021/05/04.
//

import UIKit

final class CustomTabBar: UITabBar {
    private var shapeLayer: CAShapeLayer?
    
    func configure(selectedIndex: Int) {
        guard let shapeLayer = shapeLayer else { return }
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = shapeLayer.presentation()
        pathAnimation.duration = 0.1
        shapeLayer.add(pathAnimation, forKey: "pathAnimation")
        shapeLayer.path = createPath(height: 37, selectedIndex: selectedIndex)
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
}

private extension CustomTabBar {
    func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath(height: 37, selectedIndex: 0)
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    func createPath(height: CGFloat, selectedIndex: Int) -> CGPath? {
        guard let items = self.items else { return nil }
        
        let path = UIBezierPath()
        
        let tabWidth = self.frame.width / CGFloat(items.count)
        let startTabX = tabWidth * CGFloat(selectedIndex)
        
        path.move(to: .init(x: 0, y: 0))
        
        path.addLine(to: .init(x: startTabX, y: 0))
        
        path.addCurve(to: .init(x: startTabX + tabWidth/2, y: 1.2 * height),
                      controlPoint1: .init(x: startTabX + tabWidth/2 * 0.25 , y: 0),
                      controlPoint2: .init(x: startTabX + tabWidth/2 * 0.75, y: 1.2 * height))
        
        path.addCurve(to: .init(x: startTabX + tabWidth, y: 0),
                      controlPoint1: .init(x: startTabX + tabWidth/2 + tabWidth/2 * 0.25, y: 1.2 * height),
                      controlPoint2: .init(x: startTabX + tabWidth/2 + tabWidth/2 * 0.75, y: 0))
        
        path.addLine(to: .init(x: self.frame.width, y: 0))
        path.addLine(to: .init(x: self.frame.width, y: self.frame.height))
        path.addLine(to: .init(x: 0, y: self.frame.height))
        
        path.close()
        
        return path.cgPath
    }
    
    func createPath2(height: CGFloat) -> CGPath {
        let path = UIBezierPath()
        
        let centerWidth = self.frame.midX
        let pointY1: CGFloat = 0.0
        let pointY2: CGFloat = 1.0
        
        path.move(to: .zero)
        path.addLine(to: .init(x: centerWidth - height * 2, y: 0))
        
        path.addCurve(to: .init(x: centerWidth, y: height),
                      controlPoint1: .init(x: centerWidth - pointY1, y: 0),
                      controlPoint2: .init(x: centerWidth - pointY2, y: height))
        
        path.addCurve(to: .init(x: centerWidth + height * 2, y: 0),
                      controlPoint1: .init(x: centerWidth + pointY2, y: height),
                      controlPoint2: .init(x: centerWidth + pointY1, y: 0))
        
        path.addLine(to: .init(x: self.frame.width, y: 0))
        path.addLine(to: .init(x: self.frame.width, y: self.frame.height))
        path.addLine(to: .init(x: 0, y: self.frame.height))
        
        path.close()
        
        return path.cgPath
    }
}
