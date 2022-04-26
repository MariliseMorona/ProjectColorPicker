//
//  ColorView.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class ColorView: UIView {

    lazy var stackColorView: UIStackView = {
        let stackColorView = UIStackView(arrangedSubviews: [coloredRectangle, stackSelectorView])
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
    
    lazy var stackSelectorView: UIStackView = {
        let stackSelectorView = UIStackView(arrangedSubviews: [stackFirstSelector, stackSecondSelector, stackThirdSelector])
        stackSelectorView.translatesAutoresizingMaskIntoConstraints = false
        stackSelectorView.axis = .vertical
        stackSelectorView.distribution = .fillEqually
        stackSelectorView.backgroundColor = .brown
        return stackSelectorView
    }()
    
    lazy var stackFirstSelector: UIStackView = {
        let stackFirstSelector = UIStackView(arrangedSubviews: [firstSwitch, firstSlider])
        stackFirstSelector.translatesAutoresizingMaskIntoConstraints = false
        stackFirstSelector.axis = .horizontal
        stackFirstSelector.distribution = .fillEqually
        stackFirstSelector.backgroundColor = .green
        stackFirstSelector.alignment = .center
        return stackFirstSelector
    }()
    
    lazy var stackSecondSelector: UIStackView = {
        let stackSecondSelector = UIStackView(arrangedSubviews: [secondSwitch, secondSlider])
        stackSecondSelector.translatesAutoresizingMaskIntoConstraints = false
        stackSecondSelector.axis = .horizontal
        stackSecondSelector.distribution = .fillEqually
        stackSecondSelector.backgroundColor = .gray
        stackSecondSelector.alignment = .center
        return stackSecondSelector
    }()
    
    lazy var stackThirdSelector: UIStackView = {
        let stackThirdSelector = UIStackView(arrangedSubviews: [thirdSwitch, thirdSlider])
        stackThirdSelector.translatesAutoresizingMaskIntoConstraints = false
        stackThirdSelector.axis = .horizontal
        stackThirdSelector.distribution = .fillEqually
        stackThirdSelector.backgroundColor = .red
        stackThirdSelector.alignment = .center
        return stackThirdSelector
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
    
    lazy var stackSliderView: UIStackView = {
        let stackSliderView = UIStackView(arrangedSubviews: [firstSlider, secondSlider, thirdSlider])
        stackSliderView.translatesAutoresizingMaskIntoConstraints = false
        stackSliderView.axis = .vertical
        stackSliderView.distribution = .fillProportionally
        stackSliderView.alignment = .center
        stackSliderView.backgroundColor = .systemPink
        return stackSliderView
    }()
    
    lazy var firstSlider: UISlider = {
        let firstSlider = UISlider()
        firstSlider.translatesAutoresizingMaskIntoConstraints = false
        firstSlider.addTarget(self, action: #selector(changedColorViewWithSlider(mySlider: )), for: UIControl.Event.valueChanged)
        return firstSlider
    }()
    
    lazy var secondSlider: UISlider = {
        let secondSlider = UISlider()
        secondSlider.translatesAutoresizingMaskIntoConstraints = false
        secondSlider.addTarget(self, action: #selector(changedColorViewWithSlider(mySlider: )), for: UIControl.Event.valueChanged)
        return secondSlider
    }()
    
    lazy var thirdSlider: UISlider = {
        let thirdSlider = UISlider()
        thirdSlider.translatesAutoresizingMaskIntoConstraints = false
        thirdSlider.addTarget(self, action: #selector(changedColorViewWithSlider(mySlider: )), for: UIControl.Event.valueChanged)
        return thirdSlider
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
        stackSelectorView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func changedColorView(mySwitch: UISwitch){
        var red :  CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        
        if firstSwitch.isOn{
            red = CGFloat(firstSlider.value)
        }
        if secondSwitch.isOn{
            green = CGFloat(secondSlider.value)
        }
        if thirdSwitch.isOn{
            blue = CGFloat(thirdSlider.value)
        }
    
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        coloredRectangle.backgroundColor = color
        
    }
    @objc func changedColorViewWithSlider(mySlider: UISlider){
        let redSlider = CGFloat(firstSlider.value)
        let greenSlider = CGFloat(secondSlider.value)
        let blueSlider = CGFloat(thirdSlider.value)
        
        let color = UIColor(red: redSlider, green: greenSlider, blue: blueSlider, alpha: 1)
        coloredRectangle.backgroundColor = color
    }
}
