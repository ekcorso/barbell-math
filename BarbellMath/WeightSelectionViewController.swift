//
//  WeightSelectionViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 5/28/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class WeightSelectionViewController: UIViewController {
    
    let directionsLabel = UILabel()
    
    let unitSelectionStackView = UIStackView()
    let unitLabel = UILabel()
    let unitSelector = UISegmentedControl(items: ["lbs", "kgs"])
    let unitSpacerView1 = UIView()
    let unitSpacerView2 = UIView()

    let weightSelectionStackView = UIStackView()
    let weightLabel = UILabel()
    let weightTextField = UITextField()
    let weightSpacerView1 = UIView()
    let weightSpacerView2 = UIView()
    
    let barSelectionStackView = UIStackView()
    let barLabel = UILabel()
    let barSelector = UISegmentedControl(items: ["45lb", "35lb"])
    let barSpacerView1 = UIView()
    let barSpacerView2 = UIView()
    
    let submitButton = UIButton()
    
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
        
        if let text = weightTextField.text {
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
        //Set up directionsLabel
        view.addSubview(directionsLabel)
        directionsLabel.text = "How are you planning to load the weight?"
        directionsLabel.textColor = .black
        directionsLabel.textAlignment = .center
        directionsLabel.numberOfLines = 0
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Set up weightSelectionStackView and it's subviews
        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.text = "Total Weight"
        weightLabel.textAlignment = .left
        weightLabel.textColor = .black
        weightLabel.backgroundColor = .white
        
        view.addSubview(weightTextField)
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.placeholder = "Weight"
        weightTextField.textAlignment = .center
        weightTextField.borderStyle = .line
        weightTextField.textColor = .black
        weightTextField.backgroundColor = .white
        weightTextField.keyboardType = .numberPad
        
        view.addSubview(weightSpacerView1)
        weightSpacerView1.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightSpacerView2)
        weightSpacerView2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weightSelectionStackView)
        weightSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        weightSelectionStackView.alignment = .fill
        weightSelectionStackView.axis = .horizontal
        weightSelectionStackView.distribution = .equalSpacing
        weightSelectionStackView.addArrangedSubview(weightSpacerView1)
        weightSelectionStackView.addArrangedSubview(weightLabel)
        weightSelectionStackView.addArrangedSubview(weightTextField)
        weightSelectionStackView.addArrangedSubview(weightSpacerView2)
        
        //Set up unitSelectionStackView and it's subviews
        unitSpacerView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unitSpacerView1)

        unitSpacerView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unitSpacerView2)
        
        view.addSubview(unitLabel)
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.text = "Units"
        unitLabel.textColor = .black
        unitLabel.backgroundColor = .white
        
        view.addSubview(unitSelector)
        unitSelector.apportionsSegmentWidthsByContent = true
        unitSelector.selectedSegmentIndex = 0
        unitSelector.translatesAutoresizingMaskIntoConstraints = false
        // unitSelector needs to have a func added to log the choice and/or pass it on to the next view

        view.addSubview(unitSelectionStackView)
        unitSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        unitSelectionStackView.alignment = .fill
        unitSelectionStackView.axis = .horizontal
        unitSelectionStackView.distribution = .equalSpacing
        unitSelectionStackView.backgroundColor = .white
        unitSelectionStackView.addArrangedSubview(unitSpacerView1)
        unitSelectionStackView.addArrangedSubview(unitLabel)
        unitSelectionStackView.addArrangedSubview(unitSelector)
        unitSelectionStackView.addArrangedSubview(unitSpacerView2)
        
        //Set up barSelectionStackView and it's subviews
        
        
        //Set up button
        view.addSubview(submitButton)
        submitButton.setTitle("Show me how to load it", for: UIControl.State.normal)
        submitButton.titleLabel?.textColor = .black
        submitButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        submitButton.backgroundColor = .systemTeal
        submitButton.layer.cornerRadius = 4
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(didTapWeightButton), for: .touchUpInside)
        
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
//            directionsLabel.bottomAnchor.constraint(equalTo: unitSelectionStackView.topAnchor, constant: -30),
//            directionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            directionsLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 40),
//            directionsLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -40),
//
//            unitSelectionStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            unitSelectionStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            unitSelectionStackView.heightAnchor.constraint(equalTo: weightTextField.heightAnchor),
//            unitSelectionStackView.widthAnchor.constraint(equalTo: directionsLabel.widthAnchor),
//
            weightTextField.widthAnchor.constraint(equalToConstant: 130),
            weightTextField.heightAnchor.constraint(equalToConstant: 30),

//
//            unitSpacerView1.widthAnchor.constraint(equalToConstant: 10),
//            unitSpacerView2.widthAnchor.constraint(equalToConstant: 10),
//
//            submitButton.topAnchor.constraint(equalTo: unitSelectionStackView.bottomAnchor, constant: 12),
//            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            submitButton.widthAnchor.constraint(equalTo: unitSelectionStackView.widthAnchor, multiplier: 0.8),
//            submitButton.heightAnchor.constraint(equalTo: unitSelectionStackView.heightAnchor)
            
            
            
            weightSelectionStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            weightSelectionStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            weightSelectionStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            unitSelectionStackView.topAnchor.constraint(greaterThanOrEqualTo: weightSelectionStackView.bottomAnchor, constant: 30),
            unitSelectionStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            unitSelectionStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
        ])
    }
}
