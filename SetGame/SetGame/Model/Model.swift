//
//  Model.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import Foundation


struct SetGame<CardContent> where CardContent: Equatable {
    
    var cards: [Card]
    
    var lessCards = [Card]()
    
    private let numberOfCards = 81
    
    init() {
        cards = SetGame<CardContent>.generateAllCardCombinations()
        
        for index in 0..<21{
            lessCards.append(cards[index])
        }
        
    }
    
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
        
        return cards
    }
    
    
    
    
    
}


