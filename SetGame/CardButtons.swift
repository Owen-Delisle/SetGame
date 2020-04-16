//
//  CardButtons.swift
//  SetGame
//
//  Created by Owen Delisle on 2020-04-15.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import Foundation

class CardButtons {

    public var cardButtons: [CardButton]

    init(cardButtons: [CardButton]) {
        self.cardButtons = cardButtons
    }

    public func addCardButton(cardButton: CardButton) {
        cardButtons.append(cardButton)
    }

    public func removeCardButtons(cardButton: CardButton) {
        cardButtons.remove(at: cardButtons.firstIndex(of: cardButton)!)
    }

    public func readCardButtons() -> [CardButton] {
        return cardButtons
    }
}
