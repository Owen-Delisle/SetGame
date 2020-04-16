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

    @IBOutlet weak var cardsLeftLabel: UILabel! {
        didSet {
            updateCardsLeftLabel()
        }
    }

    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            updateScoreLabel()
        }
    }

    private lazy var game = Game(cardButtons: cardButtons)

    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<game.cardButtons.count {
            let button = game.cardButtons[index]
            if let card = game.deck.drawCard() {
                game.cardsInPlay.append(card)
                button.setupButton(card: card)
            } else {
                button.removeFromSuperview()
            }
        }
    }

    @IBAction func touchCard(_ sender: CardButton) {
        if let cardNumber = game.cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateLabels()
        } else {
            print("broken")
        }
    }

    @IBAction func threeMoreButton(_ sender: Any) {
        if game.cardsInPlay.count < 24 {
            var temp = [CardButton]()
            for index in 0...2 {
                if let card = game.deck.drawCard() {

                    game.cardsInPlay.append(card)

                    let cardAboveFrame = game.cardButtons[game.cardButtons.count - 1 - index].frame
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
            game.cardButtons.append(contentsOf: temp)
            temp = []
        }
    }

    func updateLabels() {
        updateScoreLabel()
        updateCardsLeftLabel()
    }

    func updateScoreLabel() {
        scoreLabel.text = "Score: \(game.score)"
    }

    func updateCardsLeftLabel() {
        cardsLeftLabel.text = "Cards Left: \(game.deck.cards.count + game.cardsInPlay.count)"
    }
}
