//
//  RoundedView.swift
//  RoundedCornersView
//
//  Created by Ben G on 15.11.2019.
//  Copyright © 2019 beng. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    var topLeftRadius:CGFloat = 0 {
        didSet {
            roundCorners()
        }
    }
    
    var topRightRadius:CGFloat = 0 {
           didSet {
               roundCorners()
           }
       }
    
    var bottomRightRadius:CGFloat = 0 {
           didSet {
               roundCorners()
           }
       }
    
    var bottomLeftRadius:CGFloat = 0 {
           didSet {
               roundCorners()
           }
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners()
    }
    
    func roundCorners() {
        
        let bezierPath = UIBezierPath(roundedRect: frame, upperLeftRadius: topLeftRadius, upperRightRadius: topRightRadius, bottomRightRadius: bottomRightRadius, bottomLeftRadius: bottomLeftRadius)
        
        let shape = CAShapeLayer()
//        shape.bounds = frame
//        shape.position = center
        shape.path = bezierPath.cgPath
        layer.mask = shape
    }

}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat.pi / 180.0
    }
}

extension UIBezierPath {
    public convenience init(roundedRect rect: CGRect, upperLeftRadius: CGFloat, upperRightRadius: CGFloat, bottomRightRadius: CGFloat, bottomLeftRadius: CGFloat) {
        self.init()
        
        let width = rect.size.width
        let height = rect.size.height
        
        self.move(to: CGPoint(x: 0, y: upperLeftRadius))
        
        if upperLeftRadius > 0 {
            self.addArc(
                withCenter: CGPoint(x: upperLeftRadius, y: upperLeftRadius),
                radius: upperLeftRadius,
                startAngle: CGFloat(180.0).toRadians(),
                endAngle: CGFloat(270.0).toRadians(), clockwise: true)
        }
        
        self.addLine(to: CGPoint(x: width - upperRightRadius, y: 0))
        
        if upperRightRadius > 0 {
            self.addArc(
                withCenter: CGPoint(x: width - upperRightRadius, y: upperRightRadius),
                radius: upperRightRadius,
                startAngle: CGFloat(270.0).toRadians(),
                endAngle: CGFloat(0.0).toRadians(), clockwise: true)
        }
        
        self.addLine(to: CGPoint(x: width, y: height - bottomRightRadius))
        
        if bottomRightRadius > 0 {
            self.addArc(
                withCenter: CGPoint(x: width - bottomRightRadius, y: height - bottomRightRadius),
                radius: bottomRightRadius,
                startAngle: CGFloat(0.0).toRadians(),
                endAngle: CGFloat(90.0).toRadians(), clockwise: true)
        }
        
        self.addLine(to: CGPoint(x: bottomLeftRadius, y: height))
        
        if bottomLeftRadius > 0 {
            self.addArc(
                withCenter: CGPoint(x: bottomLeftRadius, y: height - bottomLeftRadius),
                radius: bottomLeftRadius,
                startAngle: CGFloat(90.0).toRadians(),
                endAngle: CGFloat(180.0).toRadians(), clockwise: true)
        }
        
        self.close()
    }
}
