//
//  ContentView.swift
//  Memorise
//
//  Created by Kennedy Kahiri on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis:[String] = ["👻","🎃","🕷️","💀","👻","🎃","🕷️","💀","👻","🎃","🕷️","💀"] //creates an array with a string or you can remove [String] and put the emojis under square brackets and it will be read as a string.
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjusters
        }
        
        .padding()
           
    }
    
    
    var cards: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 240))]) {
            
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
            
        }.foregroundColor(.orange)
        
    }

    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count )
        
    }
    
    

    var cardRemover: some View {
        
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
        
            }
           

    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
    }
    
    
    var cardAdjusters: some View {
        
        HStack {
            
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
        
    }
    
    
    
}


struct CardView: View {
    @State var isFaceUp = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



































#Preview {
    ContentView()
}
