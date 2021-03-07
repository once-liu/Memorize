//
//  ContentView.swift
//  Memorize
//
//  Created by melot on 2021/3/3.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
//        VStack {
//            ForEach(0..<4) { index in
//                HStack {
//                    ForEach(0..<4) { index in
//                        CardView(card: <#T##MemoryGame<String>.Card#>)
//                    }
//                }
//            }
//        }
        
        
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
