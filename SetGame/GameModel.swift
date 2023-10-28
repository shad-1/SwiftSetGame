//
//  SetGame.swift
//  SetGame
//
//  Created by Shad Baird on 10/24/23.
//

import Foundation
import SwiftUI

struct GameModel{
    var deck: [Card] = []
    var visibleCards: [Card] = []
    
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
    
    private func shuffle(_ cards: [Card]) -> [Card] {
        var cards = cards
        for _ in 0...Int.random(in: 2...10) {
            cards = cards.shuffled()
        }
        return cards
    }
    
    private mutating func dealCards() {
        while visibleCards.count < 12 {
            visibleCards.append(deck.removeFirst())
        }
    }
    
    init() {
        deck = buildDeck()
        deck = shuffle(deck)
        dealCards()
//        let uniqueColors = deck.reduce(into: Set()) { colors, card in
//            colors.insert(card.color)
//        }
                
        
    }
    
    mutating func choose(_ card: Card) {
        
    }
}

struct Card: Identifiable {
    //MARK: - Properties
    var id = UUID()
    var shape: SetShape
    var color: SetColor
    var shading: SetShading
    var number: SetNumber
}

enum SetShading: CaseIterable {
    case solid
    case striped
    case open
    
    var opacity: Double {
        switch self {
        case .solid:
            return 1.0
        case .striped:
            return 0.3
        case .open:
            return 0.0
        }
    }
}

enum SetNumber: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
}

enum SetShape: CaseIterable {
    case diamond
    case oval
    case squiggle
    
    var UIShape: AnyShape {
        switch self {
        case .diamond:
            return AnyShape(Diamond())
        case .oval:
            return AnyShape(Oval())
        case .squiggle:
            return AnyShape(Squiggle())
        }
    }
}

enum SetColor: CaseIterable {
    case red
    case green
    case blue
    
    var UIColor: Color {
        switch self {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        }
    }
}

