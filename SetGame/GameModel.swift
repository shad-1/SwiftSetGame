//
//  SetGame.swift
//  SetGame
//
//  Created by Shad Baird on 10/24/23.
//

import Foundation
import SwiftUI

struct SetGame{
    var deck: [Card]
    var visibleCards: [Card]
    
    
    init() {
        deck = []
        visibleCards = []
        
        deck.append(Card(shape: .diamond(Diamond()), color: .red(display: .red)))
        deck.append(Card(shape: .diamond(Diamond()), color: .red(display: .red)))
        deck.append(Card(shape: .diamond(Diamond()), color: .blue(display: .blue)))
        
        let uniqueColors = deck.reduce(into: Set()) { colors, card in
            colors.insert(card.color)
        }
        
        print(uniqueColors.count)
        
        deck.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        
    }
    
    struct Card: Identifiable {
        //MARK: - Properties
        var id = UUID()
        var shape: SetShape
        var color: SetColor
    }
}

enum SetShape {
    case diamond(any Shape)
    case oval(any Shape)
    case squiggle(any Shape)
}

enum SetColor: Hashable {
    case red(display: Color)
    case green(display: Color)
    case blue(display: Color)
}

