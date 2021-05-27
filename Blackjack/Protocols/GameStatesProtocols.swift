//
//  GameStatesProtocols.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

protocol GamestateProtocol: class {
    var blackjackViewModel: GamestateToBlackjackViewModelProtocol? {get set}
    func onEnterState()
    func willLeaveState()
    func hitButtonPress()
    func standButtonPress()
    weak var nextGamestate: GamestateProtocol? {get set}
}
protocol GamestateToBlackjackViewModelProtocol: class {
    var deck: Deck {get set}
    func updateStatusText(text: String)
    func incrementCurrentGameNum()
    func endCurrentState()
    func showRestoreStateDialog(onComplete: @escaping (()->()))
    func saveState()
}
