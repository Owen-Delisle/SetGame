//
//  CardButtonView.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-21.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class CardButtonView: UIView {

    override func draw(_ rect: CGRect) {
        let diamondView = SquiggleView(frame: CGRect(x: 0, y: 0, width: bounds.size.width * 0.75, height: bounds.size.height * 0.75))
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 0)
        roundedRect.addClip()
        Colors.coolBlue.setFill()
        roundedRect.fill()

        self.addSubview(diamondView)
    }

    func setupButton(card: Card) {
//        deselect()
//        backgroundColor      = Colors.coolBlue
//        setCardButtonTitle(with: card)
    }

    public func setCardButtonTitle(with card: Card) {

    }
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true

        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)

        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)

        shake.fromValue     = fromValue
        shake.toValue       = toValue

        layer.add(shake, forKey: "position")
    }

    func select() {
        layer.borderWidth    = 3.0
        layer.borderColor    = Colors.coolOrange.cgColor
    }

    func deselect() {
        layer.borderWidth    = 0.0
        layer.borderColor    = nil
    }
}
