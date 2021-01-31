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
        
        Group {
            GeometryReader { geometry in
                VStack {
                    Grid(items: game.cards) { card in
                        CardView(card: card)
                            .padding(3)
                            .onTapGesture(count: 1, perform: {
                                game.selectCard(card: card)
                            })
                            .transition(AnyTransition.offset(locationRandomizer(for: CGSize(width: geometry.size.width, height: geometry.size.height))))
                            .animation(.linear(duration: 0.35))
                    }
                    
                }
                
            }
            BottomPannel { game.addCards() } newGameButton: { game.newGame() }.frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                
        }
    }
    
    //source from https://github.com/vaIerika/stanford2020/blob/master/SetGame/SetGame/View/ContentView.swift
    //noticed in https://github.com/wilybear/CS193p-Assignment3-SetGame
    private func locationRandomizer(for canvas: CGSize) -> CGSize {
        let widthRange = [
            -Int(canvas.width * 1.5) ..<
                -Int(canvas.width * 1.25),
            Int(canvas.width * 1.25) ..<
                Int(canvas.width * 1.5)
        ].shuffled()
        
        let heightRange = [
            -Int(canvas.height * 1.5) ..<
                -Int(canvas.height * 1.25),
            Int(canvas.height * 1.25) ..<
                Int(canvas.height * 1.5)
        ].shuffled()
        let randomLocation = CGSize(width: Int.random(in: widthRange[0]),
                                    height: Int.random(in: heightRange[0]))
        return randomLocation
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
