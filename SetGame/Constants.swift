//
//  Constants.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-13.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

enum Colors {
    static let coolBlue = UIColor(red: 142/255, green: 214/255, blue: 247/255, alpha: 1.0)
    static let coolOrange = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
}

func addShapeLayer(path: UIBezierPath) -> CAShapeLayer {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath

    shapeLayer.strokeColor = UIColor.blue.cgColor
    shapeLayer.fillColor = UIColor.white.cgColor
    shapeLayer.lineWidth = 1.0

    return shapeLayer
}
