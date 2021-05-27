//
//  AppStartGamestate.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

class AppStartGamestate: GamestateProtocol {
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol?
    func onEnterState() {
        blackjackViewModel?.showRestoreStateDialog(onComplete: { [weak self] in
            self?.blackjackViewModel?.endCurrentState()
        })
    }
    func willLeaveState() { }
    func hitButtonPress() { }
    func standButtonPress() { }
    var nextGamestate: GamestateProtocol?
}
