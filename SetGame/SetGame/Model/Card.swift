//
//  Card.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import Foundation

enum CardNumber {
    case one
    case two
    case three
    
    static let values = [one, two, three]
}

enum CardFigure {
    case diamond
    case squiggle
    case stripe
    
    static let values = [diamond, squiggle, stripe]
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


struct Card: Identifiable {
    var id: Int
    
    var figure: CardFigure
    var color: CardColor
    var shading: CardShading
    var number: CardNumber
}
