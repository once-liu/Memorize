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
        Grid (viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(10)
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
                // FIXME:  为什么使用顺时针
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 120-90), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
            } else {
                // 已匹配过的 Card 要消失
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill()
                }
            }
        }
        .font(.system(size: systemFont(size: size)))
    }
    
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    private func systemFont(size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return ContentView(viewModel: game)
        
    }
}


