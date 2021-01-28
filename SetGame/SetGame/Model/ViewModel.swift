//
//  ViewModel.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/27/21.
//

import Foundation


class SetGame: ObservableObject {
    
    @Published private var game = Game<String>()
    
    var cards: [Card] {
        game.visibleCards
    }
    
    func selectCard(card: Card) {
        game.selectCard(card: card)
    }
    
    func addCards() {
        game.populateVisibleCards()
    }
    
}
