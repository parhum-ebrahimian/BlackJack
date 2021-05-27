//
//  DealerViewModel.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

class DealerViewModel: PlayerModel {
    private var hideFirstCard: Bool = true
    override func resetHand() {
        super.resetHand()
        hideFirstCard = true
    }
    override func updateText() {
        if (!hideFirstCard) {
            super.updateText()
        } else {
            view?.statusText = "\(playerName):"
        }
    }
    override func give(card: Card) {
        if hand.count == 0 && hideFirstCard == true {
            hand.append(card)
            view?.addHiddenCard()
            updateText()
        } else {
            super.give(card: card)
        }
    }
    func unHideFirstCard() {
        hideFirstCard = false
        if let firstCard = hand.first {
            view?.replaceFirstCard(with: firstCard)
        }
        updateText()
    }
}
