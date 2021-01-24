//
//  UIColor + Uitilities.swift
//  SetGame
//
//  Created by AP Aliaksandr Chekushkin on 1/24/21.
//

import UIKit


extension UIColor {
    func getColor(cardColor: CardColor) -> UIColor {
        switch cardColor {
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        }
    }
}

