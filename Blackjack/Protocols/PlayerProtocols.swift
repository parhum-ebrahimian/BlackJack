//
//  PlayerProtocols.swift
//  Blackjack
//
//  Created by Parhum Ebrahimian on 5/1/21.

import Foundation

protocol UIPlayerViewProtocol: class {
    var playerModel: PlayerModelProtocol? { get set }
    var statusText: String { get set }
    func add(card: Card)
    func removeAllCards()
    func addHiddenCard()
    func replaceFirstCard(with card:Card)
}
protocol PlayerModelProtocol: class {
    weak var view: UIPlayerViewProtocol? { get set }
    var hand: [Card] { get }
    var score: Int { get }
    func give(card: Card)
    func resetHand()
}
