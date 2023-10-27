//
//  SwiftUIView.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

struct GameShape: View {
    var card: Card
    var body: some View {
        ForEach(0..<card.number.rawValue, id:\.self) { _ in
            ZStack {
                card.shape.UIShape
                    .stroke()
                    .foregroundColor(card.color.UIColor)
                card.shape.UIShape
                    .foregroundColor(card.color.UIColor)
                    .opacity(card.shading.opacity)
            }
        }
    }
}

#Preview {
    GameShape(card: Card(shape: .diamond, color: .blue, shading: .striped, number: .three))
}
