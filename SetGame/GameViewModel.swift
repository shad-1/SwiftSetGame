//
//  GameViewModel.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import Foundation

@Observable class GameViewModel {
    //MARK: - Properties
    private var game = GameModel()
    
    //MARK: - Model Access
    var cards: [Card] {
        game.visibleCards
    }
    var selectedCards: [Card] {
        game.selectedCards
    }
    //MARK: - User Intents
    func choose(card: Card) {
        game.choose(card)
    }
}
