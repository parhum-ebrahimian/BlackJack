//
//  EndPlayGamestate.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

enum Winner {
    case User
    case Dealer
    case Draw
}
class EndPlayGamestate: GamestateProtocol {
    var nextGamestate: GamestateProtocol?
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    func onEnterState() {
        let winner = calculateWinner()
        switch winner {
        case .User:
            blackjackViewModel?.updateStatusText(text: "Game End. Congratulations!")
            userViewModel?.wins += 1
        case .Dealer:
            blackjackViewModel?.updateStatusText(text: "Game End. Dealer Wins")
            dealerViewModel?.wins += 1
        case .Draw:
            blackjackViewModel?.updateStatusText(text: "Game End. Draw")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.blackjackViewModel?.endCurrentState()
        }
    }
    func willLeaveState() {
        blackjackViewModel?.saveState()
    }
    func hitButtonPress() { }
    func standButtonPress() { }
    func calculateWinner() -> Winner {
        guard let userScore = userViewModel?.score,
            let dealerScore = dealerViewModel?.score else {
            return .Draw
        }
        if userScore > 21 { return .Dealer }
        if dealerScore > 21 { return .User }
        if userScore == dealerScore { return .Draw }
        if userScore > dealerScore { return .User } else {
            return .Dealer
        }
    }
}
