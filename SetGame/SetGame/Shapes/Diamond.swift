//
//  Diamond.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/23/21.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topPoint = CGPoint(x: rect.midX, y: rect.minY)
        let leftPoint = CGPoint(x: rect.minX, y: rect.midY)
        let bottomPoint = CGPoint(x: rect.midX, y: rect.maxY)
        let rightPoint = CGPoint(x: rect.maxX, y: rect.midY)
        
        path.move(to: topPoint)
        path.addLine(to: leftPoint)
        path.addLine(to: bottomPoint)
        path.addLine(to: rightPoint)
        path.addLine(to: topPoint)
        
        return path
    }
    
    
}
