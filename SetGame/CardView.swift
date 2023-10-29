//
//  CardView.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var cardsOnScreenCount: Int
    var selectedCards: [Card]
    var body: some View {
        let aspectRatio = Double(cardsOnScreenCount) / 15.0
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke(lineWidth: selectedCards.contains(where: { $0.id == card.id }) ? 3.0 : 1.0)
                    .foregroundColor(.gray)
                Text(" ")
                VStack {
                    ForEach(0..<card.number.rawValue, id:\.self) { _ in
                        GameShape(card: card)
                            .scaleEffect(0.9/aspectRatio)
                    }
                }.padding(EdgeInsets(top: 6.0, leading: 0.0, bottom: 6.0, trailing: 0.0))
            }
        }.aspectRatio(aspectRatio, contentMode: .fit)
    }
}

#Preview {
    CardView(card: Card(shape: .squiggle, color: .green, shading: .striped, number: .three), cardsOnScreenCount: 21, selectedCards: [])
}
