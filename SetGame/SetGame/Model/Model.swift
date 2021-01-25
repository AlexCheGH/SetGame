//
//  Model.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import Foundation


class SetGame<CardContent>: ObservableObject where CardContent: Equatable {
    
   @Published var visibleCards = [Card]()
    
    private var fullDeck: [Card]
    private var isFreshGame: Bool = true
    private let numberOfCards = 81
    
    init() {
        fullDeck = SetGame<CardContent>.generateAllCardCombinations()
        self.populateVisibleCards()
    }
    
    //MARK:- Getting all the cards and combinations
    static private func generateAllCardCombinations() -> [Card] {
        var cards = [Card]()
        var id = 0
        
        for color in CardColor.values {
            for figure in CardFigure.values {
                for number in CardNumber.values {
                    for shading in CardShading.values {
                        id += 1
                        let card = Card(id: id,
                                        figure: figure,
                                        color: color,
                                        shading: shading,
                                        number: number)
                        cards.append(card)
                    }
                }
            }
        }
        cards.shuffle()
        
        return cards
    }
    
    //MARK:- Populating visible cards
    func populateVisibleCards() {
        if isFreshGame {
            dealCards(numberOfCards: 21)
            isFreshGame = false
        }
        else {
            if fullDeck.count >= 1 {
                dealCards(numberOfCards: 3)
            }
        }
    }
    
    private func dealCards(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            if let element = fullDeck.first {
                visibleCards.append(element)
                fullDeck.remove(at: 0)
            }
        }
    }
}
