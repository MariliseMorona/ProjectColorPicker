//
//  ViewController.swift
//  ProjectColorPicker
//
//  Created by Marilise Morona on 25/04/22.
//

import UIKit

class ViewController: UIViewController {

    let colorView = ColorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setUp()
        
    }
    
    private func setUp(){
        view.addSubview(colorView)
        constraintLayout()
       
    }
    
    private func constraintLayout(){
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: view.topAnchor),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            colorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
        
    }
}

