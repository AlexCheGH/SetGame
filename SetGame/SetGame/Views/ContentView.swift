//
//  ContentView.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var game: SetGame<String> = SetGame()
    
    var body: some View {
        makeView()
    }
    
    func makeView() -> some View {
        VStack {
            Grid(items: game.visibleCards) { card in
                CardView(card: card)
                    .padding(5)
            }
            Button(action: {
                game.populateVisibleCards()
            }, label: {
                Text("button")
            })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
