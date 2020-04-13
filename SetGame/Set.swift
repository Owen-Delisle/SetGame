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
    private var cardButtons = [CardButton]()
    public var cardsInPlay = [Card]()

    init(cardButtons:[CardButton]) {
        self.cardButtons = cardButtons
    }

    public mutating func chooseCard(at index: Int) {
        addToSet(card: cardsInPlay[index])
    }
    public mutating func addToSet(card: Card) {
        set.append(card)
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
            for index in 0..<set.count {
                if let card = deck.drawCard() {
                    self.cardButtons[cardsInPlay.firstIndex(of: set[index])!].setCardButtonTitle(with: card)
                    cardsInPlay[cardsInPlay.firstIndex(of: set[index])!] = card
                } else {
                    self.cardButtons[cardsInPlay.firstIndex(of: set[index])!].removeFromSuperview()
                }
            }
        } else {
            for index in 0..<set.count {
                self.cardButtons[cardsInPlay.firstIndex(of: set[index])!].shake()
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
}

