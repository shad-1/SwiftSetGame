//
//  CardView.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke(lineWidth: 1.0)
                Text(" ")
                VStack {
                    ForEach(0..<card.number.rawValue, id:\.self) { _ in
                        GameShape(card: card)
                    }
                }
            }
        }.aspectRatio(5/6, contentMode: .fit)
    }
}

#Preview {
    CardView(card: Card(shape: .oval, color: .green, shading: .striped, number: .three))
}
