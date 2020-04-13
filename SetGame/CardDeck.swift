//
//  CardDeck.swift
//  Set
//
//  Created by Owen Delisle on 2020-02-23.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import Foundation

struct CardDeck {
    var cards = [Card]()

    init() {
        for color in Card.Color.all {
            for shape in Card.Shape.all {
                for fill in Card.Fill.all {
                    for number in Card.Number.all {
                        cards.append(Card(color: color, shape: shape, fill: fill, number: number))
                        swap(Int.random(in: 0..<cards.count), cards.count-1)
                    }
                }
            }
        }
    }

    mutating func swap(_ a: Int, _ b: Int) {
        var temp: Card
        temp = cards[a]
        cards[a] = cards[b]
        cards[b] = temp
    }

    mutating func drawCard() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: cards.count - 1)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
