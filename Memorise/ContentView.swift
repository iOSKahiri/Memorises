//
//  ContentView.swift
//  Memorise
//
//  Created by Kennedy Kahiri on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis:[String] = ["👻","🎃","🕷️","💀"] //creates an array with a string or you can remove [String] and put the emojis under square brackets and it will be read as a string.
    
    var body: some View {
        HStack {
            
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



































#Preview {
    ContentView()
}
