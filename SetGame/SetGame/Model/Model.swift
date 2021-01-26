//
//  Model.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import Foundation


class SetGame<CardContent>: ObservableObject where CardContent: Equatable {
    
    @Published var visibleCards = [Card]()
    
    private var selectedCards = [Card]()
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
    
    
    
    //MARK: - Card shosen method
//    func choose(card: Card) {
//
//        selectCard(card: card)
//
//        // when choosing card - change its status isChosen to True
//        // choose three cards
//        //if tapping on same card - deselect it
//        //when choosing the first and the second card - do nothing. run checker once 3 cards are selected
//        //if its a set - delete 3 cards from visible deck -> add 3 more cards to visible deck
//
//    }
    
    private func selectCard(card: Card) {
        let mainCardIndex = visibleCards.index(of: card)! // no way of getting card from outside
        
        if !selectedCards.contains(card) {
            
            selectedCards.append(card)
            visibleCards[mainCardIndex].isChosen = true //highlights the card
            
            if isSet() {
                selectedCards.forEach{
                    let index = visibleCards.index(of: $0)!
                    visibleCards.remove(at: index)
                }
                
                populateVisibleCards()
                selectedCards.removeAll()
            }
        } else {
            let index = selectedCards.index(of: card)!   //checked that card is there
            selectedCards.remove(at: index)
            
            visibleCards[mainCardIndex].isChosen = false //de-highlights the card
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
        else if selectedCards[0].color == selectedCards[0].color { return false }
        
        
        if selectedCards[0].number == selectedCards[1].number {
            if selectedCards[0].number != selectedCards[2].number { return false }
        }
        else if selectedCards[1].number == selectedCards[2].number { return false }
        else if selectedCards[0].number == selectedCards[0].number {return false }
        
        
        if selectedCards[0].figure == selectedCards[1].figure {
            if selectedCards[0].figure != selectedCards[2].figure { return false }
        }
        else if selectedCards[1].figure == selectedCards[2].figure { return false }
        else if selectedCards[0].figure == selectedCards[0].figure { return false }
        
        
        if selectedCards[0].shading == selectedCards[1].shading {
            if selectedCards[0].shading != selectedCards[2].shading { return false }
        }
        else if selectedCards[1].shading == selectedCards[2].shading { return false }
        else if selectedCards[0].shading == selectedCards[0].shading { return false }
        

        return true
    }
    
    
    
}
