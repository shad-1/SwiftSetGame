//
//  ContentView.swift
//  SetGame
//
//  Created by Shad Baird on 10/23/23.
//

import SwiftUI

struct SetGameView: View {
    var game = GameViewModel()
    var body: some View {
        VStack {
            ForEach(game.cards) { card in
                GameShape(card: card)
            }
        }
        .padding()
    }
}

#Preview {
    SetGameView()
}
