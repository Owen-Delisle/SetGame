//
//  OvalView.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-28.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class OvalView: UIView {

    var color: UIColor?
    var radius: CGFloat?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(frame: CGRect, color: UIColor, radius: CGFloat) {
        super.init(frame: frame)
        self.color = color
        self.radius = radius
        setup(frame)
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let radius = self.radius!
        let startAngle = CGFloat.pi * 0.5
        let endAngle = CGFloat.pi * 1.5

        path.addArc(withCenter: CGPoint(x: bounds.minX + radius, y: bounds.minY + radius),
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true)

        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))

        path.addArc(withCenter: CGPoint(x: bounds.maxX, y: bounds.minY + radius),
                    radius: radius,
                    startAngle: endAngle,
                    endAngle: startAngle,
                    clockwise: true)

        path.close()

        self.layer.addSublayer(colorLayer(path: path, color: self.color))
    }

    func setup(_ frame: CGRect) {
        draw(frame)
    }
}
