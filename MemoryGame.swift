//
//  MemoryGame.swift
//  Memorize
//
//  Created by melot on 2021/3/3.
//

import Foundation


// FIXME: MemoryGame<CardContent> 这里 <CardContent> 的用法 是什么意思


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        let content = cardContentFactory(numberOfPairsOfCards)
        for index in 0..<numberOfPairsOfCards {
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}


