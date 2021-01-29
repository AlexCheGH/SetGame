//
//  ContentView.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var game: SetGame = SetGame()
    
    var body: some View {
        makeView()
    }
    
    func makeView() -> some View {
        VStack {
            Grid(items: game.cards) { card in
                CardView(card: card)
                    .padding(5)
                    .onTapGesture(count: 1, perform: {
                        game.selectCard(card: card)                        
                })
            }
            Button(action: {
                game.addCards()
            }, label: {
                Text("Add cards!")
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
