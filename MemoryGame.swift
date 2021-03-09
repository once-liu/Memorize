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
        for index in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chooseIndex: Int = self.indexOf(of: card)
        self.cards[chooseIndex].isFaceUp = !self.cards[chooseIndex].isFaceUp
//        card.isFaceUp = !card.isFaceUp
    }
    
    func indexOf(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if card.id == self.cards[index].id {
                return index
            }
        }
        // TODO: bogus
        return -1
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


