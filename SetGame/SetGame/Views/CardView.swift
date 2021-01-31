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
        makeFullCard(card: card)
    }
    
    
    private func makeFullCard(card: Card) -> some View {
        let numberOfFigures = card.number.rawValue
        let lineWidth: CGFloat = 1
        let shadowRadius: CGFloat = 2
        
        return ZStack {
            RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: lineWidth).shadow(color: .black, radius: shadowRadius, x: 0, y: 1)
            VStack {
                ForEach(0..<numberOfFigures) { index in
                    getFigure(for: card.figure, shading: card.shading)
                        .padding(5)
                        .aspectRatio(2/3, contentMode: .fit)
                        .colorize(color: card.color, isChosen: card.isChosen)
                }
            }
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
        let shading = card.shading
        
        let isStriped = shading == .striped ? true : false
        let isSolid = shading == .solid ? true : false
        let isOpen = shading == .open ? true : false
        
        let image = Image("stripes")

        return Group { 
            if isStriped {
                figure.fill(ImagePaint(image: image, scale: 0.05))
            }
            if isSolid {
                figure.fill()
            }
            if isOpen {
                figure.stroke(lineWidth: 1)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static let card = Card(id: 1, figure: .lightning, color: .red, shading: .striped, number: .three)
    
    static var previews: some View {
        CardView(card: card)
    }
}
