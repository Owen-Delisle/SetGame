//
//  ViewController.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-02-23.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [CardButton]!


    @IBAction func threeMoreButton(_ sender: Any) {
        for index in 1...3 {
            if let card = game.deck.drawCard() {
                let cardAboveFrame = cardButtons[cardButtons.count - index].frame
                let x = cardAboveFrame.minX + cardAboveFrame.width
                let y = cardAboveFrame.minY + cardAboveFrame.height
                let width = cardAboveFrame.width
                let height = cardAboveFrame.height

                let button = CardButton(frame: CGRect(x: x, y: y, width: width, height: height))
                button.setCardButtonTitle(with: card)

                self.view.addSubview(button)
            }
        }
    }

    @IBAction func touchCard(_ sender: CardButton) {
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
                button.setCardButtonTitle(with: card)
            } else {
                button.removeFromSuperview()
            }
        }
    }
}
