//
//  Card.swift
//  SetGame
//
//  Created by Shad Baird on 10/28/23.
//

import Foundation

struct Card: Identifiable {
    //MARK: - Properties
    var id = UUID()
    var shape: SetShape
    var color: SetColor
    var shading: SetShading
    var number: SetNumber
}
