//
//  File.swift
//  Memorize
//
//  Created by melot on 2021/3/4.
//

import Foundation



class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: {pairIndex in  "👻" })
    
//    init() {
//        self.model = MemoryGame<String>()
//    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

