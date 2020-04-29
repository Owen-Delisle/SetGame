//
//  OvalView.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-28.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class OvalView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()

        path.addArc(withCenter: CGPoint(x: bounds.minX + 20, y: bounds.midY),
                    radius: 15,
                    startAngle: CGFloat.pi * 0.5,
                    endAngle: CGFloat.pi * 1.5,
                    clockwise: true)

        path.addLine(to: CGPoint(x: bounds.maxX - 20, y: bounds.midY - 15))

        path.addArc(withCenter: CGPoint(x: bounds.maxX - 20, y: bounds.midY),
                    radius: 15,
                    startAngle: CGFloat.pi * 1.5,
                    endAngle: CGFloat.pi * 0.5,
                    clockwise: true)

        path.close()

        self.layer.addSublayer(addShapeLayer(path: path))
    }

    func setup(_ frame: CGRect) {
        draw(frame)
    }
}
