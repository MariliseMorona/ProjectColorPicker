//
//  ColorView.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class ColorView: UIView {

    lazy var stackColorView: UIStackView = {
        let stackColorView = UIStackView(arrangedSubviews: [coloredRectangle, firstSwitch])
        stackColorView.translatesAutoresizingMaskIntoConstraints = false
        stackColorView.axis = .vertical
        stackColorView.spacing = 30
        stackColorView.backgroundColor = .orange
        return stackColorView
    }()
    
    lazy var coloredRectangle : UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .black
        return colorView
    }()
    
    lazy var firstSwitch: UISwitch = {
       let firstSwitch = UISwitch()
        firstSwitch.translatesAutoresizingMaskIntoConstraints = false
        firstSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        return firstSwitch
    }()
    
//    lazy var stackSwitchView: UIStackView = {
//        let stackSwitchView = UIStackView()
//        stackSwitchView.translatesAutoresizingMaskIntoConstraints = false
//        stackSwitchView.axis = .vertical
//        stackSwitchView.spacing = 30
//        stackSwitchView.backgroundColor = .brown
//        return stackSwitchView
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        addSubview(stackColorView)
        constraintLayout()
        
    }
    
    private func constraintLayout(){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackColorView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            stackColorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackColorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackColorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
    
    @objc func changedColorView(mySwitch: UISwitch){
        if mySwitch.isOn{
            coloredRectangle.backgroundColor = .systemPink
        } else {
            coloredRectangle.backgroundColor = .gray
        }
    }

}
