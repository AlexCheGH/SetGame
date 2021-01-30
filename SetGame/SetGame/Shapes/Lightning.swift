//
//  Squiggle.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import SwiftUI

struct Lightning: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX * 0.7, y: rect.minY)) //start
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.55))
        path.addLine(to: CGPoint(x: rect.maxX * 0.4, y: rect.maxY * 0.55))
        
        path.addLine(to: CGPoint(x: rect.midX * 0.5, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.45))
        path.addLine(to: CGPoint(x: rect.maxX * 0.6, y: rect.maxY * 0.45))
        
        path.addLine(to: CGPoint(x: rect.maxX * 0.7, y: rect.minY))
               
               return path
    }
    
  
}

struct Lightning_Previews: PreviewProvider {
    static var previews: some View {
        Lightning().stroke(lineWidth: 3)
    }
}
