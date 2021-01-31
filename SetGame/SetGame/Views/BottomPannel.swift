//
//  BottomPannel.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/31/21.
//

import SwiftUI

struct BottomPannel: View {
    
    private let drawString = NSLocalizedString("draw", comment: "")
    private let newGameString = NSLocalizedString("new_game", comment: "")
    
    var drawButton: () -> Void
    var newGameButton: () -> Void
    
    var body: some View {
        HStack {
            makeButtonView(action: { drawButton() }, title: drawString).padding()
            Spacer()
            makeButtonView(action: { newGameButton() }, title: newGameString).padding()
        }
    }
    
    
    private func makeButtonView(action: @escaping() -> Void, title: String) -> some View {
        VStack {
            ZStack {
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1)
                    Button(title) {
                        action()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }.onTapGesture(count: 1, perform: { action() })
        }
        .padding()
    }
    
}

struct BottomPannel_Previews: PreviewProvider {
    static var previews: some View {
        BottomPannel {} newGameButton: {}
    }
}
