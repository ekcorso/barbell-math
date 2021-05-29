//
//  WeightSelectionViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 5/28/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class WeightSelectionViewController: UIViewController {
    
    let weightText = UITextField()
    let weightButton = UIButton()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Are we gunna lift?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        establishSubviews()
        setConstraints()
    }
    
    func didTapWeightButton() {
        //pass the weight to the next vc
    }
    
}

extension WeightSelectionViewController {
    
    func establishSubviews() {
        view.addSubview(weightText)
        weightText.placeholder = "Weight goes here"
        weightText.borderStyle = .line
        weightText.textColor = .black
        weightText.backgroundColor = .white
        weightText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightButton)
        weightButton.setTitle("Show me the numbers!", for: UIControl.State.normal)
        weightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        weightButton.backgroundColor = .systemTeal
        weightButton.layer.cornerRadius = 4
        //weightButton.layer.borderWidth = 1
        //weightButton.layer.borderColor = UIColor.gray.cgColor
        weightButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            weightText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            weightText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            
            weightButton.topAnchor.constraint(equalTo: weightText.bottomAnchor, constant: 10),
            weightButton.centerXAnchor.constraint(equalTo: weightText.centerXAnchor, constant: 0),
        ])
    }
}
