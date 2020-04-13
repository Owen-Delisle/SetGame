//
//  ViewController.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-02-23.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {
        print("touched")
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
        } else {
            print("broken")
        }
    }

    private lazy var game = Game(cardButtons: cardButtons)

    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<cardButtons.count {
            let button = cardButtons[index]
            if let card = game.deck.drawCard() {
                game.cardsInPlay.append(card)
                setCardButtonTitle(for: button, with: card)
            } else {
                button.removeFromSuperview()
            }
        }
//        let newButton = UIButton.init(type: .roundedRect)
//        newButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        newButton.setTitle("poo", for: .normal)
//        self.view.addSubview(newButton)
    }

    public func setCardButtonTitle(for button: UIButton, with card: Card) {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth: card.fill.strokeWidth,
                .strokeColor: card.color.c,
                .foregroundColor: card.color.c.withAlphaComponent(card.fill.alpha)
        ]
        let attributedString = NSAttributedString(string: repeatTitle(card: card), attributes: attributes)
        button.setAttributedTitle(attributedString, for: UIControl.State.normal)
    }

    private func repeatTitle(card: Card) -> String {
        var buttonTitle: String = ""
        for _ in 0..<card.number.rawValue {
            buttonTitle += "\(card.shape.rawValue)"
        }
        return buttonTitle
    }
}
