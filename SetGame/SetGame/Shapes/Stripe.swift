//
//  Stripe.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/24/21.
//

import SwiftUI

struct Stripe: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY * 0.3))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.3),
                      control1: CGPoint(x: rect.minX, y: rect.minY),
                      control2: CGPoint(x: rect.maxX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.7))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY * 0.7),
                      control1: CGPoint(x: rect.maxX, y: rect.maxY),
                      control2: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.3))
        
        return path
    }
}

struct Stripe_Previews: PreviewProvider {
    static var previews: some View {
        Stripe()
    }
}
