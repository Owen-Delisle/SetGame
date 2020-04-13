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
        if cardButtons.count < 24 {
            var temp = [CardButton]()
            for index in 0...2 {
                if let card = game.deck.drawCard() {

                    game.cardsInPlay.append(card)

                    let cardAboveFrame = cardButtons[cardButtons.count - 1 - index].frame
                    let x = cardAboveFrame.minX
                    let y = cardAboveFrame.minY + cardAboveFrame.height + 8
                    let width = cardAboveFrame.width
                    let height = cardAboveFrame.height

                    let button = CardButton(frame: CGRect(x: x, y: y, width: width, height: height))
                    button.setupButton(card: card)

                    temp.append(button)
                    self.view.addSubview(button)
                    button.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
                }
            }
            for index in 0...temp.count - 1 {
                cardButtons.append(temp[index])
            }
            game.updateCardButtons(cardButtons: cardButtons)
            temp = []
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
