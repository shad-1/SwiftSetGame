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
        GeometryReader { geometry in
            LazyVGrid(columns: columns(for: geometry.size)) {
                ForEach(game.cards) { card in
                    if game.selectedCards.contains(where: { $0.id == card.id }) {
                        CardView(card: card)
                            .onTapGesture {
                                game.choose(card: card)
                            }.background(.thickMaterial)
                    } else {
                        CardView(card: card)
                            .onTapGesture {
                                game.choose(card: card)
                            }
                    }
                }
            }.padding()
        }
    }
    
    private func columns(for screenSize: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()),
              count: Int(min(screenSize.width, screenSize.height)
                         / Constants.minCardWidth
              )
        )
    }
}

private struct Constants {
    static let minCardWidth = 125.0
}

#Preview {
    SetGameView()
}
