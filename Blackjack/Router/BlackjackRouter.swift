//
//  BlackjackRouter.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

class BlackjackRouter: BlackjackRouterProtocol {
    static func attachViewModel(to viewController: BlackjackViewControllerProtocol) {
        let viewModel = BlackjackViewModel()
        let userModel = UserViewModel()
        let dealerModel = DealerViewModel()
        let blackjackRouter = BlackjackRouter()
        let savedState = SavedState()
        userModel.playerName = "User"
        dealerModel.playerName = "Dealer"
        viewModel.viewController = viewController
        viewModel.router = blackjackRouter
        viewModel.savedState = savedState
        viewController.viewModel = viewModel
        userModel.view = viewController.userView
        viewController.userView.playerModel = userModel
        dealerModel.view = viewController.dealerView
        viewController.dealerView.playerModel = dealerModel
        viewModel.userViewModel = userModel
        viewModel.dealerViewModel = dealerModel
    }
    func createGameStates(with viewModel: BlackjackViewModelProtocol) -> [GamestateProtocol] {
        let appStartGamestate = AppStartGamestate()
        let newGameState = NewPlayGamestate()
        let userPlayGameState = UserPlayGamestate()
        let dealerPlayGameState = DealerPlayGamestate()
        let endPlayGameState = EndPlayGamestate()
        appStartGamestate.nextGamestate = newGameState
        newGameState.nextGamestate = userPlayGameState
        userPlayGameState.nextGamestate = dealerPlayGameState
        dealerPlayGameState.nextGamestate = endPlayGameState
        endPlayGameState.nextGamestate = newGameState
        if let viewModelForGamestates = viewModel as? GamestateToBlackjackViewModelProtocol {
            newGameState.blackjackViewModel = viewModelForGamestates
            userPlayGameState.blackjackViewModel = viewModelForGamestates
            dealerPlayGameState.blackjackViewModel = viewModelForGamestates
            endPlayGameState.blackjackViewModel = viewModelForGamestates
            appStartGamestate.blackjackViewModel = viewModelForGamestates
        }
        newGameState.userViewModel = viewModel.userViewModel
        newGameState.dealerViewModel = viewModel.dealerViewModel
        userPlayGameState.userViewModel = viewModel.userViewModel
        dealerPlayGameState.dealerViewModel = viewModel.dealerViewModel
        endPlayGameState.userViewModel = viewModel.userViewModel
        endPlayGameState.dealerViewModel = viewModel.dealerViewModel
        return [appStartGamestate, newGameState, userPlayGameState, dealerPlayGameState, endPlayGameState]
    }
}
