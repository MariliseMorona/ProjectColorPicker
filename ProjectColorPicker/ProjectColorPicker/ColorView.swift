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
        colorView.translatesAutoresizingMaskIntoConstraints = false
        return colorView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        addSubview(coloredRectangle)
        constraintLayout()
        
    }
    
    private func constraintLayout(){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coloredRectangle.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            coloredRectangle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            coloredRectangle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            coloredRectangle.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

}
