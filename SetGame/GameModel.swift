//
//  SetGame.swift
//  SetGame
//
//  Created by Shad Baird on 10/24/23.
//

import Foundation
import SwiftUI

struct GameModel{
    var deck: [Card]
    var visibleCards: [Card]
    
    
    init() {
        deck = []
        visibleCards = []
        
        deck.append(Card(shape: .diamond, color: .red, shading: .solid, number: .one))
        deck.append(Card(shape: .oval, color: .blue, shading: .striped, number: .two))
        deck.append(Card(shape: .squiggle, color: .green, shading: .open, number: .three))
        
        let uniqueColors = deck.reduce(into: Set()) { colors, card in
            colors.insert(card.color)
        }
        
        print(uniqueColors.count)
        
        deck.shuffle()
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

enum SetShading {
    case solid
    case striped
    case open
    
    var opacity: Double {
        switch self {
        case .solid:
            return 1.0
        case .striped:
            return 0.4
        case .open:
            return 0.0
        }
    }
}

enum SetNumber: Int {
    case one = 1
    case two = 2
    case three = 3
}

enum SetShape {
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

enum SetColor: Hashable {
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

