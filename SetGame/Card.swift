//
//  Card.swift
//  Set
//
//  Created by Owen Delisle on 2020-02-23.
//  Copyright © 2020 Owen Delisle. All rights reserved.
//

import Foundation
import UIKit

struct Card: Hashable
{
    var color: Color
    var shape: Shape
    var fill: Fill
    var number: Number

    enum Color {
        case blue
        case red
        case green

        var c: UIColor {
            switch self {
            case .blue: return UIColor.systemBlue
            case .red: return UIColor.systemRed
            case .green: return UIColor.systemGreen
            }
        }
        static var all = [Color.blue, Color.red, Color.green]
    }

    enum Shape: String {
        case diamond = "diamond"
        case oval = "oval"
        case squiggle = "squiggle"

        static var all = [Shape.diamond, Shape.oval, Shape.squiggle]
    }

    enum Fill: String {
        case filled = "filled"
        case striped = "striped"
        case empty = "empty"

        var strokeWidth: Int {
            switch self {
            case .filled: return -1
            case .empty: return 10
            case .striped: return -1
            }
        }

        var alpha: CGFloat {
            switch self {
            case .filled: return 1
            case .empty: return 1
            case .striped: return 0.15
            }
        }

        static var all = [Fill.filled, Fill.striped, Fill.empty]
    }

    enum Number: Int {
        case one = 1
        case two = 2
        case three = 3

        static var all = [Number.one, Number.two, Number.three]
    }
}
