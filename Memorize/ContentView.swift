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
        VStack {
            Grid (viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.5)) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(10)
            }
            .padding()
            .foregroundColor(.orange)
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    viewModel.resetGame()
                }
            } label: { Text("New game") }

        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{geometry in
            self.body(size: geometry.size)
        }
    }
    
    // FIXME: ViewBuilder 的用法
    @ViewBuilder
    func body(size: CGSize) -> some View {
        // 选中的显示正面 || 匹配过之后不再显示
        if card.isFaceUp || !card.isMatched {
            // FIXME: 倒计时动画实现
            ZStack {
                // FIXME:  为什么使用顺时针
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 120-90), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(.system(size: systemFont(size: size)))
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    
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


