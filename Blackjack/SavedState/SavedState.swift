//
//  SavedState.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

enum StateParam: String {
    case gameCount = "gameCount"
    case userWins = "userWins"
    case dealerWins = "dealerWins"
}
class SavedState: SavedStateProtocol {
    var hasPreviousSavedState: Bool {
        get {
            return UserDefaults.standard.object(forKey: StateParam.gameCount.rawValue) != nil
        }
    }
    func getPreviousState(_ callBack: @escaping ((gameCount: Int, userWins: Int, dealerWins: Int))->()) {
        let gameCount = UserDefaults.standard.integer(forKey: StateParam.gameCount.rawValue)
        let userWins = UserDefaults.standard.integer(forKey: StateParam.userWins.rawValue)
        let dealerWins = UserDefaults.standard.integer(forKey: StateParam.dealerWins.rawValue)
        callBack((gameCount, userWins, dealerWins))
    }
    func setState(gameCount: Int, userWins: Int, dealerWins: Int) {
        UserDefaults.standard.set(gameCount, forKey: StateParam.gameCount.rawValue)
        UserDefaults.standard.set(userWins, forKey: StateParam.userWins.rawValue)
        UserDefaults.standard.set(dealerWins, forKey: StateParam.dealerWins.rawValue)
    }
}
