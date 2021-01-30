//
//  Colorize.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/24/21.
//

import SwiftUI

struct Colorize: ViewModifier {

    private var color: Color
    var isChosen: Bool
    
    init(color: CardColor, isChosen: Bool) {
        self.isChosen = isChosen
        
        if !isChosen  {
        self.color = Color(UIColor().getColor(cardColor: color))
        } else {
            self.color = .black
        }
    }
    
    func body(content: Content) -> some View {
        content.foregroundColor(color)
    }
}

extension View {
    func colorize(color: CardColor, isChosen: Bool) -> some View {
        self.modifier(Colorize(color: color, isChosen: isChosen))
    }
}
