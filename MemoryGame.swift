//
//  MemoryGame.swift
//  Memorize
//
//  Created by melot on 2021/3/3.
//

import Foundation


// FIXME: MemoryGame<CardContent> 这里 <CardContent> 的用法 是什么意思


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    /// 有且仅有一张向上
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        // card 有效；正面朝下的牌；未匹配过的牌
        if let chooseIndex = self.cards.firstIndex(matching: card), !cards[chooseIndex].isFaceUp, !cards[chooseIndex].isMatched {
            // FIXME: 什么时候设置了 indexOfTheOneAndOnlyFaceUpCard = nil
            if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchedIndex].content == cards[chooseIndex].content {
                    cards[potentialMatchedIndex].isMatched = true
                    cards[chooseIndex].isMatched = true
                }
                
                self.cards[chooseIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chooseIndex
                
                /*
                 // 1. 翻出第一张牌时
                 // 2. 翻出第三章牌，但前两张不同。即 isMatched = false
                 for index in cards.indices {
                     cards[index].isFaceUp = false
                 }
                 indexOfTheOneAndOnlyFaceUpCard = chooseIndex
                 */
                
            }
        }
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


