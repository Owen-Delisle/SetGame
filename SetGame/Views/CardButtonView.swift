//
//  CardButtonView.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-21.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class CardButtonView: UIView {
    var card: Card?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(frame: CGRect, card: Card) {
        self.card = card
        super.init(frame: frame)
    }

    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 0)
        roundedRect.addClip()
        Colors.coolBlue.setFill()
        roundedRect.fill()

        for index in 1...self.card!.number.rawValue {
            let shapeView = setupButton(card: self.card!, number: CGFloat(index))!
            self.addSubview(shapeView)
        }
    }

    func setupButton(card: Card, number: CGFloat) -> UIView? {
        deselect()
        backgroundColor      = Colors.coolBlue
        return setCardButtonTitle(card: card, number: number)
    }

    public func setCardButtonTitle(card: Card, number: CGFloat) -> UIView? {
        var shape: UIView? = nil
            switch card.shape.rawValue {
            case "diamond":
                shape = drawDiamond(color: card.color.c, number: number)
            case "oval":
                shape = drawOval(color: card.color.c)
            case "squiggle":
                shape = drawSquiggle(color: card.color.c)
            default:
                shape = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width * 0.75, height: bounds.size.height * 0.75))
            }
        return shape
    }

    func drawDiamond(color: UIColor, number: CGFloat) -> DiamondView {
        let diamondWidth = bounds.size.width * 0.25
        let diamondHeight = bounds.size.height * 0.75
        return DiamondView(frame: CGRect(x: ((bounds.size.width / 2) - (diamondWidth / 2)) / number, y: (bounds.size.height / 2) - (diamondHeight / 2), width: diamondWidth, height: diamondHeight), color: color)
    }

    func drawOval(color: UIColor) -> OvalView {
        let ovalHeight: CGFloat = 10
        let ovalWidth = (bounds.size.width - ovalHeight) * 0.55

        return OvalView(frame: CGRect(x: (bounds.size.width / 2) - (ovalWidth / 2), y: (bounds.size.height / 2) - (ovalHeight / 2), width: ovalWidth, height: ovalHeight), color: color, radius: ovalHeight)
    }

    func drawSquiggle(color: UIColor) -> SquiggleView {
        return SquiggleView(frame: CGRect(x: 0, y: 0, width: bounds.size.width * 0.75, height: bounds.size.height * 0.75), color: color)
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
