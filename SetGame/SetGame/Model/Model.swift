//
//  Model.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import Foundation


struct Game<CardContent> where CardContent: Equatable {
    
    var visibleCards = [Card]()
    
    private var selectedCards = [Card]()
    private var fullDeck: [Card]
    private var needFullRefresh: Bool = true
    private let numberOfCards = 81
    
    
    init() {
        fullDeck = Game<CardContent>.generateAllCardCombinations()
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
    mutating func populateVisibleCards() {
        if needFullRefresh {
            dealCards(numberOfCards: 21)
            needFullRefresh = false
        }
        else {
            if fullDeck.count >= 1 && !(visibleCards.count > 24) {
                dealCards(numberOfCards: 3)
            } else {
                visibleCards.forEach{ fullDeck.append($0) }
                visibleCards.removeAll()
                needFullRefresh = true
                populateVisibleCards()
            }
        }
    }
    
    private mutating func dealCards(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            if let element = fullDeck.first {
                visibleCards.append(element)
                fullDeck.remove(at: 0)
            }
        }
    }
    
    //MARK: - Card shosen method
    
    mutating func selectCard(card: Card) {
        let mainCardIndex = visibleCards.index(of: card)! // no way of getting card from outside
        visibleCards[mainCardIndex].isChosen = true
        
        if !selectedCards.contains(card) {
            selectedCards.append(visibleCards[mainCardIndex])  //highlights the card
        } else {
            let index = selectedCards.index(of: card)!   //checked that card is there
            selectedCards.remove(at: index)
            visibleCards[mainCardIndex].isChosen = false //de-highlights the card
        }
        if isSet() {
            selectedCards.forEach{
                let index = visibleCards.index(of: $0)!
                visibleCards.remove(at: index)
            }
            populateVisibleCards()
        }
        if selectedCards.count > 3 {
            selectedCards.removeAll()
            selectedCards.append(visibleCards[mainCardIndex])
            visibleCards[mainCardIndex].isChosen = true
        }
    }
    
    private func isSet() -> Bool {
        
        if selectedCards.count != 3 {
            return false
        }
        
        if selectedCards[0].color == selectedCards[1].color {
            if selectedCards[0].color != selectedCards[2].color { return false }
        }
        else if selectedCards[1].color == selectedCards[2].color { return false }
        else if selectedCards[0].color == selectedCards[2].color { return false }
        
        
        if selectedCards[0].number.rawValue == selectedCards[1].number.rawValue {
            if selectedCards[0].number.rawValue != selectedCards[2].number.rawValue { return false }
        }
        else if selectedCards[1].number.rawValue == selectedCards[2].number.rawValue { return false }
        else if selectedCards[0].number.rawValue == selectedCards[2].number.rawValue {return false }
        
        
        if selectedCards[0].figure == selectedCards[1].figure {
            if selectedCards[0].figure != selectedCards[2].figure { return false }
        }
        else if selectedCards[1].figure == selectedCards[2].figure { return false }
        else if selectedCards[0].figure == selectedCards[2].figure { return false }
        
        
        if selectedCards[0].shading == selectedCards[1].shading {
            if selectedCards[0].shading != selectedCards[2].shading { return false }
        }
        else if selectedCards[1].shading == selectedCards[2].shading { return false }
        else if selectedCards[0].shading == selectedCards[2].shading { return false }
        
        return true
    }
}
