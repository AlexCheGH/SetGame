//
//  Colorize.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/24/21.
//

import SwiftUI

struct Colorize: ViewModifier {

    private var color: Color
    
    init(color: CardColor) {
        self.color = Color(UIColor().getColor(cardColor: color))
    }
    
    func body(content: Content) -> some View {
        content.foregroundColor(color)
    }
}

extension View {
    func colorize(color: CardColor) -> some View {
        self.modifier(Colorize(color: color))
    }
}

