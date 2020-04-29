//
//  DiamondView.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-28.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class DiamondView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        path.close()
        
        self.layer.addSublayer(addShapeLayer(path: path))
    }
    
    func setup(_ frame: CGRect) {
        draw(frame)
    }
}
