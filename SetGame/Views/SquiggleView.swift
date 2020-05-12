//
//  SquiggleView.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-28.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class SquiggleView: UIView {

    var color: UIColor?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
        setup(frame)
    }

    override func draw(_ rect: CGRect) {
        let offset: CGFloat = bounds.width * 0.30
        let curveTwoOffset: CGFloat = bounds.width * 0.20
        let radius: CGFloat = 5

        let path = UIBezierPath()

        path.move(to: CGPoint(x: bounds.minX + offset + curveTwoOffset , y: bounds.maxY - offset + curveTwoOffset))

        path.addCurve(to: CGPoint(x: bounds.maxX - offset + curveTwoOffset, y: bounds.minY + offset + curveTwoOffset),
                      controlPoint1: CGPoint(x: bounds.maxX - offset + curveTwoOffset, y: bounds.midY + offset + curveTwoOffset),
                      controlPoint2: CGPoint(x: offset + curveTwoOffset, y: offset + curveTwoOffset))

        path.addArc(withCenter: CGPoint(x: bounds.maxX - offset + curveTwoOffset, y: bounds.minY + offset + radius),
                    radius: radius,
                    startAngle: CGFloat.pi * 0.5,
                    endAngle: CGFloat.pi * 1.5,
                    clockwise: false)

        path.addLine(to: CGPoint(x: bounds.maxX - offset, y: bounds.minY + offset))

        path.move(to: CGPoint(x: bounds.minX + offset, y: bounds.maxY - offset))

        path.addCurve(to: CGPoint(x: bounds.maxX - offset, y: bounds.minY + offset),
                      controlPoint1: CGPoint(x: bounds.maxX - offset, y: bounds.midY + offset),
                      controlPoint2: CGPoint(x: offset, y: offset))

        path.move(to: CGPoint(x: bounds.minX + offset, y: bounds.maxY - offset))

        path.addArc(withCenter: CGPoint(x: bounds.minX + offset, y: bounds.maxY - offset + radius),
                    radius: radius,
                    startAngle: CGFloat.pi * 1.5,
                    endAngle: CGFloat.pi * 0.5,
                    clockwise: false)

        path.addLine(to: CGPoint(x: bounds.minX + offset + curveTwoOffset , y: bounds.maxY - offset + curveTwoOffset))

        self.layer.addSublayer(colorLayer(path: path, color: self.color))
    }

    func setup(_ frame: CGRect) {
        draw(frame)
    }
}
