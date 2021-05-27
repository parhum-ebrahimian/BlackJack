//
//  Deck.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

typealias Deck = Set<Card>
extension Set where Element == Card {
    mutating func resetDeck() {
        self.removeAll()
        let suites: [Suite] = [.Club, .Diamond, .Heart, .Spade]
        let digitValues: [DigitValue] = [.v2, .v3, .v4, .v5, .v6, .v7, .v8, .v9, .v10]
        for suite in suites {
            for digit in digitValues {
                self.insert(Card.Digit(suite, digit))
            }
            self.insert(Card.Jack(suite))
            self.insert(Card.Queen(suite))
            self.insert(Card.King(suite))
            self.insert(Card.Ace(suite))
        }
    }
    mutating func takeRandomCard() -> Card {
        guard let cardToTake = self.count == 0 ? nil : self[self.index(self.startIndex, offsetBy: Int(arc4random()) % self.count)] else {
            fatalError()
        }
        self.remove(cardToTake)
        return cardToTake
    }
}
