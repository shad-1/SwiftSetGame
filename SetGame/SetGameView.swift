//
//  ContentView.swift
//  SetGame
//
//  Created by Shad Baird on 10/23/23.
//

import SwiftUI

struct SetGameView: View {
    var game = SetGame()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    SetGameView()
}
