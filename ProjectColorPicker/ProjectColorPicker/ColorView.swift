//
//  ColorView.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class ColorView: UIView {
    
    var red :  CGFloat = 0
    var green : CGFloat = 0
    var blue : CGFloat = 0
    
    lazy var stackColorView: UIStackView = {
        let stackColorView = UIStackView(arrangedSubviews: [coloredRectangle, stackSelectorView, resetButton])
        stackColorView.translatesAutoresizingMaskIntoConstraints = false
        stackColorView.axis = .vertical
        stackColorView.spacing = 30

        return stackColorView
    }()
    
    lazy var coloredRectangle : UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.layer.borderWidth = 5
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.layer.cornerRadius = 20
        return colorView
    }()
    
    lazy var stackSelectorView: UIStackView = {
        let stackSelectorView = UIStackView(arrangedSubviews: [stackFirstSelector, stackSecondSelector, stackThirdSelector])
        stackSelectorView.translatesAutoresizingMaskIntoConstraints = false
        stackSelectorView.axis = .vertical
        stackSelectorView.distribution = .fillEqually
        return stackSelectorView
    }()
    
    lazy var stackFirstSelector: UIStackView = {
        let stackFirstSelector = UIStackView(arrangedSubviews: [firstSwitch, firstSlider])
        stackFirstSelector.translatesAutoresizingMaskIntoConstraints = false
        stackFirstSelector.axis = .horizontal
        stackFirstSelector.distribution = .fillEqually
        stackFirstSelector.alignment = .center
        return stackFirstSelector
    }()
    
    lazy var stackSecondSelector: UIStackView = {
        let stackSecondSelector = UIStackView(arrangedSubviews: [secondSwitch, secondSlider])
        stackSecondSelector.translatesAutoresizingMaskIntoConstraints = false
        stackSecondSelector.axis = .horizontal
        stackSecondSelector.distribution = .fillEqually
        stackSecondSelector.alignment = .center
        return stackSecondSelector
    }()
    
    lazy var stackThirdSelector: UIStackView = {
        let stackThirdSelector = UIStackView(arrangedSubviews: [thirdSwitch, thirdSlider])
        stackThirdSelector.translatesAutoresizingMaskIntoConstraints = false
        stackThirdSelector.axis = .horizontal
        stackThirdSelector.distribution = .fillEqually
        stackThirdSelector.alignment = .center
        return stackThirdSelector
    }()
    
    
    lazy var firstSwitch: UISwitch = {
       let firstSwitch = UISwitch()
        firstSwitch.translatesAutoresizingMaskIntoConstraints = false
        firstSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        firstSwitch.onTintColor = .red
        return firstSwitch
    }()
    
    lazy var secondSwitch: UISwitch = {
       let secondSwitch = UISwitch()
        secondSwitch.translatesAutoresizingMaskIntoConstraints = false
        secondSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        secondSwitch.onTintColor = .green
        return secondSwitch
    }()
    
    lazy var thirdSwitch: UISwitch = {
       let thirdSwitch = UISwitch()
        thirdSwitch.translatesAutoresizingMaskIntoConstraints = false
        thirdSwitch.addTarget(self, action: #selector(changedColorView(mySwitch:)), for: UIControl.Event.valueChanged)
        thirdSwitch.onTintColor = .blue
        return thirdSwitch
    }()
    
    lazy var stackSliderView: UIStackView = {
        let stackSliderView = UIStackView(arrangedSubviews: [firstSlider, secondSlider, thirdSlider])
        stackSliderView.translatesAutoresizingMaskIntoConstraints = false
        stackSliderView.axis = .vertical
        stackSliderView.distribution = .fillProportionally
        stackSliderView.alignment = .center
        return stackSliderView
    }()
    
    lazy var firstSlider: UISlider = {
        let firstSlider = UISlider()
        firstSlider.translatesAutoresizingMaskIntoConstraints = false
        firstSlider.addTarget(self, action: #selector(changedColorViewWithSlider(mySlider: )), for: UIControl.Event.valueChanged)
        firstSlider.minimumTrackTintColor = .red
        return firstSlider
    }()
    
    lazy var secondSlider: UISlider = {
        let secondSlider = UISlider()
        secondSlider.translatesAutoresizingMaskIntoConstraints = false
        secondSlider.addTarget(self, action: #selector(changedColorViewWithSlider(mySlider: )), for: UIControl.Event.valueChanged)
        secondSlider.minimumTrackTintColor = .green
        return secondSlider
    }()
    
    lazy var thirdSlider: UISlider = {
        let thirdSlider = UISlider()
        thirdSlider.translatesAutoresizingMaskIntoConstraints = false
        thirdSlider.addTarget(self, action: #selector(changedColorViewWithSlider(mySlider: )), for: UIControl.Event.valueChanged)
        thirdSlider.minimumTrackTintColor = .blue
        return thirdSlider
    }()
    
    lazy var resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle("reset", for: .normal)
        resetButton.addTarget(self, action: #selector(tappedButton(sender:)), for: .touchUpInside)
        return resetButton
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
    
    func updateColorView(){
        
        if firstSwitch.isOn{
            red = CGFloat(firstSlider.value)
        } else {
            red = 0
        }
        
        if secondSwitch.isOn{
            green = CGFloat(secondSlider.value)
        } else {
            green = 0
        }
        
        if thirdSwitch.isOn{
            blue = CGFloat(thirdSlider.value)
        } else {
            blue = 0
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        coloredRectangle.backgroundColor = color
    }
    
    @objc func changedColorView(mySwitch: UISwitch){
        updateColorView()
        
    }
    @objc func changedColorViewWithSlider(mySlider: UISlider){
        updateColorView()
    }
    
    @objc func tappedButton(sender: UIButton){
        firstSwitch.isOn = false
        secondSwitch.isOn = false
        thirdSwitch.isOn = false
        firstSlider.value = 0
        secondSlider.value = 0
        thirdSlider.value = 0
        
        updateColorView()
    }
    
    func updateControls(){
        firstSlider.isEnabled = firstSwitch.isOn
        secondSlider.isEnabled = secondSwitch.isOn
        thirdSlider.isEnabled = thirdSwitch.isOn
    }
   
}
