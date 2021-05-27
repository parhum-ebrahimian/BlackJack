//
//  NewPlayGamestate.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

class NewPlayGamestate: GamestateProtocol {
    var nextGamestate: GamestateProtocol?
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    func onEnterState() {
        guard let blackjackViewModel: GamestateToBlackjackViewModelProtocol = blackjackViewModel else {
            fatalError()
        }
        blackjackViewModel.incrementCurrentGameNum()
        blackjackViewModel.updateStatusText(text: "New Game")
        blackjackViewModel.deck.resetDeck()
        dealerViewModel?.resetHand()
        userViewModel?.resetHand()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.dealerViewModel?.give(card: blackjackViewModel.deck.takeRandomCard())
            self?.dealerViewModel?.give(card: blackjackViewModel.deck.takeRandomCard())
            self?.userViewModel?.give(card: blackjackViewModel.deck.takeRandomCard())
            self?.userViewModel?.give(card: blackjackViewModel.deck.takeRandomCard())
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.blackjackViewModel?.endCurrentState()
            }
        }
    }
    func willLeaveState() { }
    func hitButtonPress() { }
    func standButtonPress() { }
}
