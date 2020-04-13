//
//  CardButton.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-13.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class CardButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    func setupButton() {
    }

    public func setCardButtonTitle(with card: Card) {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth: card.fill.strokeWidth,
            .strokeColor: card.color.c,
            .foregroundColor: card.color.c.withAlphaComponent(card.fill.alpha)
        ]
        let attributedString = NSAttributedString(string: repeatTitle(card: card), attributes: attributes)
        self.setAttributedTitle(attributedString, for: UIControl.State.normal)
    }

    private func repeatTitle(card: Card) -> String {
        var buttonTitle: String = ""
        for _ in 0..<card.number.rawValue {
            buttonTitle += "\(card.shape.rawValue)"
        }
        return buttonTitle
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
}

//        let newButton = UIButton.init(type: .roundedRect)
//        newButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        newButton.setTitle("poo", for: .normal)
//        self.view.addSubview(newButton)
