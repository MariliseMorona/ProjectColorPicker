//
//  ColorView.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class ColorView: UIView {

    lazy var stackColorView: UIStackView = {
        let stackColorView = UIStackView(arrangedSubviews: [coloredRectangle, stackSwitchView])
        stackColorView.translatesAutoresizingMaskIntoConstraints = false
        stackColorView.axis = .vertical
        stackColorView.spacing = 30
//        stackColorView.backgroundColor = .orange
        return stackColorView
    }()
    
    lazy var coloredRectangle : UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .black
        return colorView
    }()
    
    lazy var stackSwitchView: UIStackView = {
        let stackSwitchView = UIStackView(arrangedSubviews: [firstSwitch, secondSwitch, thirdSwitch])
        stackSwitchView.translatesAutoresizingMaskIntoConstraints = false
        stackSwitchView.axis = .vertical
        stackSwitchView.distribution = .fillProportionally
        stackSwitchView.alignment = .center
//        stackSwitchView.backgroundColor = .brown
        return stackSwitchView
    }()
    
    lazy var firstSwitch: UISwitch = {
       let firstSwitch = UISwitch()
        firstSwitch.translatesAutoresizingMaskIntoConstraints = false
        firstSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        return firstSwitch
    }()
    
    lazy var secondSwitch: UISwitch = {
       let secondSwitch = UISwitch()
        secondSwitch.translatesAutoresizingMaskIntoConstraints = false
        secondSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        return secondSwitch
    }()
    
    lazy var thirdSwitch: UISwitch = {
       let thirdSwitch = UISwitch()
        thirdSwitch.translatesAutoresizingMaskIntoConstraints = false
        thirdSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        return thirdSwitch
    }()
    
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
        coloredRectangle.heightAnchor.constraint(equalToConstant: 300).isActive = true
        stackSwitchView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func changedColorView(mySwitch: UISwitch){
        var red :  CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        
        if firstSwitch.isOn{
            red = 1
        }
        if secondSwitch.isOn{
            green = 1
        }
        if thirdSwitch.isOn{
            blue = 1
        }
    
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        coloredRectangle.backgroundColor = color
        
    }
}
