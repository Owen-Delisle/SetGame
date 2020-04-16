//
//  Set.swift
//  Set
//
//  Created by Owen Delisle on 2020-02-23.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import Foundation
import UIKit

struct Game {
    var deck = CardDeck()
    private var set = [Card]()
    private var viewController = ViewController()
    public var cardButtons = [CardButton]()
    public var cardsInPlay = [Card]()
    public var score = 0

    init(cardButtons:[CardButton]) {
        self.cardButtons = cardButtons
    }

    public mutating func updateCardButtons(cardButtons:[CardButton]) {
        self.cardButtons = cardButtons
    }

    public mutating func chooseCard(at index: Int) {
        let cardInSet = cardsInPlay[index]
        if set.contains(cardInSet) {
            cardButtons[cardsInPlay.firstIndex(of: cardInSet)!].deselect()
            set.remove(at: set.firstIndex(of: cardsInPlay[index])!)
        } else {
            addToSet(card: cardsInPlay[index])
        }
    }

    public mutating func addToSet(card: Card) {
        set.append(card)
        cardButtons[cardsInPlay.firstIndex(of: card)!].select()
        if set.count == 3 {
            checkForSet()
            set = []
        }
    }

    private mutating func checkForSet() {
        let cardOneCardTwo = compareAttributes(lhs: set[0], rhs: set[1])
        let cardTwoCardThree = compareAttributes(lhs: set[1], rhs: set[2])
        let cardOneCardThree = compareAttributes(lhs: set[0], rhs: set[2])
        if cardOneCardTwo == cardTwoCardThree && cardOneCardTwo == cardOneCardThree {
            if indexGTTwelve() {
                removeCardsInSet()
                reorderCards(cardsInPlay: cardsInPlay)
            } else {
                replaceCards()
            }
            score += 1
        } else {
            for index in 0..<set.count {
                let cardButtonInSet = cardButtons[cardsInPlay.firstIndex(of: set[index])!]
                cardButtonInSet.shake()
                cardButtonInSet.deselect()
                score -= 1
            }
        }
    }

    func compareAttributes(lhs: Card, rhs: Card) -> [String] {
        var equalAttributes = [String]()
        if lhs.color == rhs.color {
            equalAttributes.append("color")
        }
        if lhs.shape == rhs.shape {
            equalAttributes.append("shape")
        }
        if lhs.fill == rhs.fill {
            equalAttributes.append("fill")
        }
        if lhs.number == rhs.number {
            equalAttributes.append("number")
        }
        return equalAttributes
    }

    mutating func replaceCards() {
        for index in 0..<set.count {
            if let card = deck.drawCard() {
                let cardButtonInSet = self.cardButtons[cardsInPlay.firstIndex(of: set[index])!]
                cardButtonInSet.setCardButtonTitle(with: card)
                cardButtonInSet.deselect()
                cardsInPlay[cardsInPlay.firstIndex(of: set[index])!] = card
            } else {
                removeCardButtons(index: index)
            }
        }
    }

    func removeCardButtons(index: Int) {
        let cardButtonInSet = self.cardButtons[cardsInPlay.firstIndex(of: set[index])!]
        cardButtonInSet.removeFromSuperview()
    }

    func indexGTTwelve() -> Bool {
        for index in 0..<set.count {
            let cardButtonInSet = self.cardButtons[cardsInPlay.firstIndex(of: set[index])!]
            if cardButtons.firstIndex(of: cardButtonInSet)! > 12 {
                return true
            }
        }
        return false
    }

    mutating func removeCardsInSet() {
        for index in 0..<set.count {
            self.cardButtons[cardsInPlay.firstIndex(of: set[index])!].deselect()
            cardsInPlay.remove(at: cardsInPlay.firstIndex(of: set[index])!)
        }
    }

    mutating func reorderCards(cardsInPlay: [Card]) {
        for index in 0..<cardsInPlay.count {
            cardButtons[index].setupButton(card: cardsInPlay[index])
        }

        for index in cardsInPlay.count..<cardButtons.count {
            cardButtons[index].removeFromSuperview()
        }
        
        cardButtons.removeLast(3)
    }
}
