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
        let animation = Animation.linear(duration: 0.1).repeatCount(10)
        GeometryReader { geometry in
            VStack {
                LazyVGrid(columns: columns(for: geometry.size)) {
                    ForEach(game.cards) { card in
                        CardView(card: card, cardsOnScreenCount: game.cards.count, selectedCards: game.selectedCards)
                            .transition(.offset(randomOffScreenLocation))
                            .onTapGesture {
                                game.choose(card: card)
                            }
                            .offset(x: cardInHintSet(card) ? -2 : 0, y: cardInHintSet(card) ? 2 : 0)
                            .animation(animation, value: cardInHintSet(card))
                            .transition(.offset(randomOffScreenLocation))
                    }
                }.padding()
                Spacer()
                HStack {
                    Button(action: { game.addAdditionalCards() }, label: { Text("+ 3 Cards") })
                        .frame(width: 110, height: 50)
                        .background(.regularMaterial)
                        .disabled(game.cannotDealThree)
                    Spacer()
                    Button(action: { game.newGame() }, label: { Text("New Game") })
                        .frame(width: 110, height: 50)
                        .background(.regularMaterial)
                    Spacer()
                    Button(action: { game.giveHint() }, label: { Text("Hint") })
                        .frame(width: 110, height: 50)
                        .background(.regularMaterial)
                        .disabled(!game.validSetOnScreen)
                }.padding()
            }
        }.onAppear {
            game.dealCards()
        }
    }
    
    //MARK: - Helpers
    private var randomOffScreenLocation: CGSize {
        let screen = UIScreen.main.bounds
        let radius = max(screen.width, screen.height) * 1.5
        let xFactor = Double.random(in: -1...1)
        let yFactor = Double.random(in: -1...1)
        
        return CGSize(width: radius * xFactor, height: radius * yFactor)
    }
    private func columns(for screenSize: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()),
              count: Int(min(screenSize.width, screenSize.height)
                         / Constants.minCardWidth
              )
        )
    }
    private func cardInHintSet(_ card: Card) -> Bool {
        guard let hintCard = game.hintCard else {
            return false
        }
        return card.id == hintCard.id
    }
}

private struct Constants {
    static let minCardWidth = 125.0
}

#Preview {
    SetGameView()
}
