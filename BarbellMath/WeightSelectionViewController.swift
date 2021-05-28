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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Are we gunna lift?"
        view.backgroundColor = .systemGray
    
        establishSubviews()
    }
    
    func didTapWeightButton() {
        //pass the weight to the next vc
    }
    
}

extension WeightSelectionViewController {
    
    func establishSubviews() {
        weightText.placeholder = "Weight goes here"
        weightText.borderStyle = .line
        weightText.textColor = .black
        weightText.backgroundColor = .white
        weightText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightText)
        
        weightButton.setTitle("Show me the numbers!", for: UIControl.State.normal)
        weightButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightText)
    }
    
    func setConstraints() {
        
    }
}
