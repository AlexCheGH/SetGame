//
//  Card.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import Foundation

enum CardNumber: Int {
    case one = 1
    case two
    case three
    
    static let values = [one, two, three]
}

enum CardFigure {
    case diamond
    case lightning
    case stripe
    
    static let values = [diamond, lightning, stripe]
}

enum CardColor {
    case red
    case green
    case blue
    
    static let values = [red, green, blue]
}

enum CardShading {
    case solid
    case striped
    case open
    
    static let values = [solid, striped, open]
}


struct Card: Identifiable, Equatable {
    
    var id: Int
    
    var figure: CardFigure
    var color: CardColor
    var shading: CardShading
    var number: CardNumber
    
    var isMatched = false
    var isChosen = false
    
    
    
    //MARK:- Card comparison extension
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.color == rhs.color &&
            lhs.figure == rhs.figure &&
            lhs.shading == rhs.shading &&
            lhs.number.rawValue == rhs.number.rawValue
    }
    
}
