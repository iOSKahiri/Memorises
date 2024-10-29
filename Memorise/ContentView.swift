//
//  ContentView.swift
//  Memorise
//
//  Created by Kennedy Kahiri on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2.0)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}



































#Preview {
    ContentView()
}
