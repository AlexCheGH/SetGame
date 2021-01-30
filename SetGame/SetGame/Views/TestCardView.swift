//
//  TestCardView.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/30/21.
//

import SwiftUI

struct TestCardView: View {
    
    var card: Card
    
    var body: some View {
        makeGrid()
    }
    
    
    
    func makeGrid() -> some View {
        VStack {
        Group {
            Lightning().padding().aspectRatio(2/3, contentMode: .fit)
            Diamond().padding().aspectRatio(2/3, contentMode: .fit)
            Lightning().padding().aspectRatio(2/3, contentMode: .fit)
            Diamond().padding().aspectRatio(2/3, contentMode: .fit)
            Lightning().padding().aspectRatio(2/3, contentMode: .fit)
            Diamond().padding().aspectRatio(2/3, contentMode: .fit)
            Lightning().padding().aspectRatio(2/3, contentMode: .fit)
            Diamond().padding(2).aspectRatio(2/3, contentMode: .fit)
        }
    }
    }
}

struct TestCardView_Previews: PreviewProvider {
    
    static let card = Card(id: 12, figure: .diamond, color: .green, shading: .solid, number: .three)
    
    static var previews: some View {
        TestCardView(card: card)
    }
}
