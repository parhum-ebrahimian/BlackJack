//
//  BlackjackViewModel.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

class BlackjackViewModel {
    var viewController: BlackjackViewControllerProtocol?
    var router: BlackjackRouterProtocol?
    weak var userViewModel: UserViewModel?
    weak var dealerViewModel: DealerViewModel?
    var gameStates: [GamestateProtocol] = [];
    weak var currentGameState: GamestateProtocol?
    var savedState: SavedStateProtocol?
    var deck: Deck = Deck()
    private var currentGameNum = 0
}
extension BlackjackViewModel: BlackjackViewModelProtocol {
    func viewDidLoad() {
        if let newGameStates = router?.createGameStates(with: self),
            let firstGameState = newGameStates.first {
            gameStates = newGameStates
            currentGameState = firstGameState
            currentGameState?.onEnterState()
        }
    }
    func hitButtonPress() {
        currentGameState?.hitButtonPress()
    }
    func standButtonPress() {
        currentGameState?.standButtonPress()
    }
}
extension BlackjackViewModel: GamestateToBlackjackViewModelProtocol {
    func showRestoreStateDialog(onComplete: @escaping (() -> ())) {
        if savedState?.hasPreviousSavedState == true {
            viewController?.showDialog("Load Previous State?", response: { [weak self] selectedOK in
                if selectedOK == true {
                    self?.savedState?.getPreviousState { [weak self] (gameCount, userWins, dealerWins) in
                        self?.currentGameNum = gameCount
                        self?.userViewModel?.wins = userWins
                        self?.dealerViewModel?.wins = dealerWins
                        onComplete()
                    }
                } else {
                    onComplete()
                }
            })
        } else {
            onComplete()
        }
    }
    func saveState() {
        if let userWins = userViewModel?.wins,
            let dealerWins = dealerViewModel?.wins {
            savedState?.setState(gameCount: currentGameNum, userWins: userWins, dealerWins: dealerWins)
        }
    }
    func incrementCurrentGameNum() {
        currentGameNum += 1
        viewController?.setCurrentGame(text: "Game Number: \(currentGameNum)")
    }
    func updateStatusText(text: String) {
        viewController?.setGameStatus(text: text)
    }
    func endCurrentState() {
        currentGameState?.willLeaveState()
        currentGameState = currentGameState?.nextGamestate
        currentGameState?.onEnterState()
    }
}
