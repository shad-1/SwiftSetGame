//
//  SetGame.swift
//  SetGame
//
//  Created by Shad Baird on 10/24/23.
//

import Foundation
import SwiftUI

struct GameModel{
    //MARK: - Properties
    var deck: [Card] = []
    var visibleCards: [Card] = []
    var selectedCards: [Card] = []
    var isValidSetOnScreen: Bool = false
    var hintValidSet: [Card] = []
    
    //MARK: - Game Setup
    private func buildDeck() -> [Card] {
        var cards: [Card] = []
        for shape in SetShape.allCases {
            for color in SetColor.allCases {
                for shading in SetShading.allCases {
                    for num in SetNumber.allCases {
                        cards.append(Card(shape: shape, color: color, shading: shading, number: num))
                    }
                }
            }
        }
        return cards
    }
    
    //Shuffle the deck a random number of times--just for good measure
    private func shuffle(_ cards: [Card]) -> [Card] {
        var cards = cards
        for _ in 0...Int.random(in: 2...10) {
            cards = cards.shuffled()
        }
        return cards
    }
    
    mutating func dealCards() {
        while visibleCards.count < 12 {
            visibleCards.append(deck.removeFirst())
        }
        isValidSetOnScreen = checkForValidSetOnScreen()
    }
    
    init() {
        deck = buildDeck()
        deck = shuffle(deck)
        isValidSetOnScreen = checkForValidSetOnScreen()
    }
    
    //MARK: - Validation Functions
    // Returns a dictionary of {value:count} for all of the properties on all of the cards provided
    private func getValueCounts(for cards: [Card]) -> [String: Int] {
        var valueCounts: [String: Int] = [:]
        for card in cards {
            // Use Reflection to pull all the properties off each card instance
            Mirror(reflecting: card).children.forEach { prop in
                // Don't track unique ID's.
                if prop.label != "id" {
                    let propertyValue = String(describing: prop.value)
                    if let currentCount = valueCounts[propertyValue] {
                        valueCounts[propertyValue] = currentCount + 1
                    } else {
                        valueCounts[propertyValue] = 1
                    }
                }
            }
        }
        return valueCounts
    }
    
    private func isValidSet(among cards: [Card], using countingFunction: ([Card]) -> [String:Int]) -> Bool {
        let counts = countingFunction(cards)
        if counts.values.contains(where: { $0 == 2 }) {
            return false
        } else {
            return true
        }
    }
    
    mutating func checkForValidSetOnScreen() -> Bool {
        checkAllGroupsOf3(among: visibleCards)
    }

    // Loop through all possible 3-card combinations in the provided list to check for valid sets. Returns early to reduce average case time complexity.
    mutating func checkAllGroupsOf3(among cards: [Card]) -> Bool {
        for card1 in cards {
            for card2 in cards.filter({ $0.id != card1.id }) {
                for card3 in cards.filter({ $0.id != card2.id }) {
                    let groupToCheck = [card1, card2, card3]
                    if isValidSet(among: groupToCheck, using: getValueCounts) {
                        hintValidSet = groupToCheck
                        return true
                    }
                }
            }
        }
        return false
    }
    
    let idComparer = { (_ card1: Card, _ card2: Card) in
        card1.id == card2.id
    }
    
    //MARK: - User Intent
    mutating func choose(_ card: Card) {
        // De-select card if already selected
        if let foundIndex = selectedCards.firstIndex(where:{ $0.id == card.id }) {
            selectedCards.remove(at: foundIndex)
        } else {
            selectedCards.append(card)
            // Check for match if 3 cards are selected
            if selectedCards.count == 3 {
                if checkAllGroupsOf3(among: selectedCards) {
                    for selectedCard in selectedCards {
                        guard let index = visibleCards.firstIndex(where:{ $0.id == selectedCard.id }) else {
                            return
                        }
                        visibleCards.remove(at: index)
                        }
                    dealThreeCards()
                }
                selectedCards = []
            }
        }
    }
    
    mutating func dealThreeCards() {
        if !isValidSetOnScreen || visibleCards.count < 12 {
            for _ in 0..<3 {
                if !deck.isEmpty {
                    visibleCards.append(deck.removeFirst())
                }
            }
        isValidSetOnScreen = checkForValidSetOnScreen()
        }
    }
}



