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
        
        path.move(to: CGPoint(x: rect.midX + 40, y: rect.minY)) //start
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        
        
        path.addLine(to: CGPoint(x: rect.midX - 40, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.midX + 40, y: rect.minY)) //end
        
               
               return path
    }
    
  
}

struct Lightning_Previews: PreviewProvider {
    static var previews: some View {
        Lightning()
    }
}
