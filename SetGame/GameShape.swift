//
//  SwiftUIView.swift
//  SetGame
//
//  Created by Shad Baird on 10/27/23.
//

import SwiftUI

struct GameShape: View {
    var body: some View {
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

#Preview {
    SetShape()
}
