//
//  WeightSelectionViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 5/28/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class WeightSelectionViewController: UIViewController {
    
    let userChoicesView = UIStackView()
    let directionsLabel = UILabel()
    let weightText = UITextField()
    let weightButton = UIButton()
    let unitSelector = UISegmentedControl(items: ["lbs", "kgs"])
    let spacerView1 = UIView()
    let spacerView2 = UIView()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Barbell Math"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        establishSubviews()
        setConstraints()
    }
    
    @objc func didTapWeightButton() {
        let viewController = PlateCountViewController()
        
        if let text = weightText.text {
            if let weightAsDouble = Double(text) {
                viewController.totalWeight = weightAsDouble
            } else {
                print("Weight is not a number")
                let alert = UIAlertController(title: "That's not a number...", message: "Please re-enter the weight you want to lift as a numeric value", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension WeightSelectionViewController {
    
    func establishSubviews() {

        spacerView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spacerView1)

        spacerView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spacerView2)
        
        view.addSubview(unitSelector)
        unitSelector.apportionsSegmentWidthsByContent = true
        unitSelector.selectedSegmentIndex = 0
        unitSelector.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(directionsLabel)
        directionsLabel.text = "Enter the total weight you want to lift."
        directionsLabel.textColor = .black
        directionsLabel.textAlignment = .center
        directionsLabel.numberOfLines = 0
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightText)
        weightText.placeholder = "Weight"
        weightText.textAlignment = .center
        weightText.borderStyle = .line
        weightText.textColor = .black
        weightText.backgroundColor = .white
        weightText.keyboardType = .numberPad
        weightText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightButton)
        weightButton.setTitle("Show me how to load it", for: UIControl.State.normal)
        weightButton.titleLabel?.textColor = .black
        weightButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        weightButton.backgroundColor = .systemTeal
        weightButton.layer.cornerRadius = 4
        weightButton.translatesAutoresizingMaskIntoConstraints = false
        weightButton.addTarget(self, action: #selector(didTapWeightButton), for: .touchUpInside)
        
        view.addSubview(userChoicesView)
        userChoicesView.translatesAutoresizingMaskIntoConstraints = false
        userChoicesView.alignment = .center
        userChoicesView.axis = .horizontal
        userChoicesView.distribution = .equalSpacing
        userChoicesView.backgroundColor = .white
        userChoicesView.addArrangedSubview(spacerView1)
        userChoicesView.addArrangedSubview(weightText)
        userChoicesView.addArrangedSubview(unitSelector)
        userChoicesView.addArrangedSubview(spacerView2)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            directionsLabel.bottomAnchor.constraint(equalTo: userChoicesView.topAnchor, constant: -30),
            directionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            directionsLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 40),
            directionsLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -40),
            
            userChoicesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userChoicesView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            userChoicesView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            userChoicesView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            userChoicesView.heightAnchor.constraint(equalTo: weightText.heightAnchor),
            userChoicesView.widthAnchor.constraint(equalTo: directionsLabel.widthAnchor),
            
            weightText.widthAnchor.constraint(equalToConstant: 130),
            weightText.heightAnchor.constraint(equalToConstant: 40),
                        
            spacerView1.widthAnchor.constraint(equalToConstant: 10),
            spacerView2.widthAnchor.constraint(equalToConstant: 10),

            weightButton.topAnchor.constraint(equalTo: userChoicesView.bottomAnchor, constant: 12),
            weightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightButton.widthAnchor.constraint(equalTo: userChoicesView.widthAnchor, multiplier: 0.8),
            weightButton.heightAnchor.constraint(equalTo: userChoicesView.heightAnchor)
        ])
    }
}
