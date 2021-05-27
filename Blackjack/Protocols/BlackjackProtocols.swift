//
//  BlackjackProtocols.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

protocol BlackjackViewControllerProtocol: class {
    var viewModel: BlackjackViewModelProtocol? {get set}
    weak var dealerView: UIPlayerView! {get}
    weak var userView: UIPlayerView! {get}
    func setGameStatus(text: String)
    func setCurrentGame(text: String)
    func showDialog(_ text: String, response: @escaping ((Bool)->()))
}
protocol BlackjackViewModelProtocol: class {
    weak var viewController: BlackjackViewControllerProtocol? {get set}
    var router: BlackjackRouterProtocol? {get set}
    weak var userViewModel: UserViewModel? {get set}
    weak var dealerViewModel: DealerViewModel? {get set}
    func viewDidLoad()
    func hitButtonPress()
    func standButtonPress()
}
protocol BlackjackRouterProtocol: class {
    func createGameStates(with viewModel: BlackjackViewModelProtocol) -> [GamestateProtocol]
}
