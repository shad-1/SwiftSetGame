//
//  SetShape.swift
//  SetGame
//
//  Created by Shad Baird on 10/28/23.
//

import Foundation
import SwiftUI

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
