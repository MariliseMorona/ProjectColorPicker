//
//  ColorView.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class ColorView: UIView {

    lazy var coloredRectangle : UIView = {
        let colorView = UIView()
        colorView.backgroundColor = .black
        return colorView
    }()

}
