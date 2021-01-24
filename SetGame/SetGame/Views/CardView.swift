//
//  CardView.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/24/21.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        makeView()
    }
    
    
    
    func makeView() -> some View {
        ZStack {
            
            getFigure(for: card.figure, shading: card.shading)
                .padding()
                .colorize(color: card.color)
        }
    }
    
    private func getFigure(for figure: CardFigure, shading: CardShading) -> some View {
      
        return Group {
            switch figure {
            case .diamond:
                makeShape(figure: Diamond())
            case .lightning:
                makeShape(figure: Lightning())
            case .stripe:
                makeShape(figure: Stripe())
            }
        }
    }

    private func makeShape<Element>(figure: Element) -> some View where Element: Shape{
        
        
        let color = UIColor().getColor(cardColor: card.color)
        let shading = card.shading
        
        let isStriped = shading == .striped ? true : false
        let isSolid = shading == .solid ? true : false
        let isOpen = shading == .open ? true : false
        
        return Group {
            if isStriped {
                figure.stripes(colors: (.white, color))
            }
            if isSolid {
                figure.fill()
            }
            if isOpen {
                figure.stroke(lineWidth: 3)
            }
        }
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    
    static let card = Card(id: 1, figure: .diamond, color: .blue, shading: .striped, number: .two)
    
    static var previews: some View {
        CardView(card: card)
    }
}
