//
//  SavedStateProtocol.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

protocol SavedStateProtocol {
    var hasPreviousSavedState: Bool { get }
    func getPreviousState(_ callBack: @escaping ((gameCount: Int, userWins: Int, dealerWins: Int))->())
    func setState(gameCount: Int, userWins: Int, dealerWins: Int)
}
