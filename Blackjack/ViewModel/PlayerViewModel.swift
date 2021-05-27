//
//  PlayerViewModel.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

class PlayerModel: PlayerModelProtocol {
    var view: UIPlayerViewProtocol?
    var hand = [Card]()
    var playerName = "Unnamed"
    var wins = 0
    func give(card: Card) {
        hand.append(card)
        view?.add(card: card)
        updateText()
    }
    func resetHand() {
        hand.removeAll()
        view?.removeAllCards()
    }
    func updateText() {
        let scoreText = score > 21 ? "BUST" : "\(score)"
        view?.statusText = "\(playerName): Score:\(scoreText) Wins:\(wins)"
    }
    var score: Int {
        get {
            var score = hand.reduce(0) { (previous, card) -> Int in
                switch(card) {
                case .Digit(_, let digitValue):
                    return previous + digitValue.rawValue
                case .Jack(_):
                    return previous + 10
                case .Queen(_):
                    return previous + 10
                case .King(_):
                    return previous + 10
                case .Ace(_):
                    return previous + 11
                }
            }
            _ = hand.filter { (card) -> Bool in
                switch (card) {
                case .Ace(_):
                    return true
                default:
                    return false
                }
                } .map {_ in
                    if score > 21 {
                        score -= 10
                    }
            }
            return score
        }
    }
    
    
}
