//
//  ContentView.swift
//  Memorize
//
//  Created by melot on 2021/3/3.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{geometry in
            self.body(size: geometry.size)
        }
    }
    
    func body(size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
            }
        }
        .font(.system(size: systemFont(size: size)))
    }
    
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 3
    func systemFont(size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            
    }
}
