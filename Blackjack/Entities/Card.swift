//
//  Card.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

enum Suite: String {
    case Club = "c"
    case Diamond = "d"
    case Heart = "h"
    case Spade = "s"
}
enum DigitValue: Int {
    case v2 = 2
    case v3 = 3
    case v4 = 4
    case v5 = 5
    case v6 = 6
    case v7 = 7
    case v8 = 8
    case v9 = 9
    case v10 = 10
}
enum Card: Hashable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    var hashValue: Int {
        get {
            return self.stringValue.hashValue
        }
    }
    var stringValue: String {
        get {
            switch self {
            case .Digit(let suite, let digit):
                return "\(suite.rawValue)\(digit.rawValue)"
            case .Jack(let suite):
                return "\(suite.rawValue)j"
            case .Queen(let suite):
                return "\(suite.rawValue)q"
            case .King(let suite):
                return "\(suite.rawValue)k"
            case .Ace(let suite):
                return "\(suite.rawValue)a"
            }
        }
    }
    case Digit(Suite, DigitValue)
    case Jack(Suite)
    case Queen(Suite)
    case King(Suite)
    case Ace(Suite)
}
