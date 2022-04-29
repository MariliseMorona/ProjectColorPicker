//
//  Model.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 26/04/22.
//

import UIKit

struct Colors {
    
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return color
    }
    
    mutating func colorDefault() -> UIColor {
        red = 225/256
        green = 227/256
        blue = 229/256
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return color
    }
}
