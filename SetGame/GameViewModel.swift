//
//  GameViewModel.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

@Observable class GameViewModel {
    //MARK: - Properties
    private var game = GameModel()
    private var hintCount = 0
    var hintCard: Card? = nil
    
    //MARK: - Model Access
    var cards: [Card] {
        game.visibleCards
    }
    var selectedCards: [Card] {
        game.selectedCards
    }
    var validSetOnScreen: Bool {
        game.isValidSetOnScreen
    }
    var cannotDealThree: Bool {
        game.isValidSetOnScreen || game.deck.isEmpty
    }
    var hintValidSet: [Card] {
        game.hintValidSet
    }
    //MARK: - User Intents
    func choose(card: Card) {
        withAnimation(.easeInOut(duration: Constants.animationDuration / 2)) {
            game.choose(card)
        }
    }
    func addAdditionalCards() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)) {
            game.dealThreeCards()
        }
    }
    func giveHint() {
        if hintCount == 3 {
            hintCount = 0
        }
        hintCard = hintValidSet[hintCount]
        hintCount += 1
    }
    
    func dealCards() {
        withAnimation(.easeInOut(duration: Constants.animationDuration)) {
            game.dealCards()
        }
    }
    
    func newGame() {
        withAnimation(.easeIn(duration: Constants.animationDuration)) {
            game = GameModel()
        }
        dealCards()
    }
    
    //MARK: - Contants
    private struct Constants {
        static let animationDuration = 0.5
    }
}
