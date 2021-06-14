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
    
    let allOptionsStackView = UIStackView()
    
    let unitSelectionStackView = UIStackView()
    let unitLabel = UILabel()
    var unitSelector = UISegmentedControl(items: [Units.lb.rawValue, Units.kg.rawValue])
    let unitSpacerView1 = UIView()
    let unitSpacerView2 = UIView()

    let weightSelectionStackView = UIStackView()
    let weightLabel = UILabel()
    let weightTextField = UITextField()
    let weightSpacerView1 = UIView()
    let weightSpacerView2 = UIView()
    
    let barSelectionStackView = UIStackView()
    let barLabel = UILabel()
    let barSelectorItemsInLbs = [BarSizeInLbs.fourtyFive.asString(), BarSizeInLbs.thirtyFive.asString()]
    let barSelectorItemsInKgs = [BarSizeInKilos.twenty.asString(), BarSizeInKilos.fifteen.asString()]
    var barSelector = UISegmentedControl(items: [])
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
        
        if unitsSetTo() == Units.lb.rawValue {
            barSelector = UISegmentedControl(items: barSelectorItemsInLbs)
        } else {
            barSelector = UISegmentedControl(items: barSelectorItemsInKgs)
        }
    
        establishSubviews()
        setConstraints()
    }
    
    @objc func didTapSubmitButton() {
        let viewController = PlateCountViewController()
        
        if let text = weightTextField.text {
            if let weightAsDouble = Double(text) {
                viewController.totalWeight = weightAsDouble
                viewController.units = unitsSetTo()
                viewController.barWeight = barSetTo()
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
    
    @objc func updateBarSizeOptions() {
        switch unitSelector.selectedSegmentIndex {
        case 0:
            barSelector.removeAllSegments()
            barSelector.insertSegment(withTitle: "\(BarSizeInLbs.fourtyFive.asString())", at: 0, animated: false)
            barSelector.insertSegment(withTitle: "\(BarSizeInLbs.thirtyFive.asString())", at: 1, animated: false)
            barSelector.selectedSegmentIndex = 0
        case 1:
            barSelector.removeAllSegments()
            barSelector.insertSegment(withTitle: "\(BarSizeInKilos.twenty.asString())", at: 0, animated: false)
            barSelector.insertSegment(withTitle: "\(BarSizeInKilos.fifteen.asString())", at: 1, animated: false)
            barSelector.selectedSegmentIndex = 0
        default:
            print("This unit selection is unhandled")
        }
    }
    
    @objc func unitsSetTo() -> String {
        switch unitSelector.selectedSegmentIndex {
        case 0:
            return Units.lb.rawValue
        case 1:
            return Units.kg.rawValue
        default:
            print("This unit selection is unhandled")
            return Units.lb.rawValue
        }
    }
    
    @objc func barSetTo() -> Int {
        switch barSelector.selectedSegmentIndex {
        case 0:
            if unitsSetTo() == Units.lb.rawValue {
                return BarSizeInLbs.fourtyFive.asInt()
            } else {
                return BarSizeInKilos.twenty.asInt()
            }
        case 1:
            if unitsSetTo() == Units.lb.rawValue {
                return BarSizeInLbs.thirtyFive.asInt()
            } else {
                return BarSizeInKilos.fifteen.asInt()
            }
        default:
            print("This bar size selection is unhandled")
            return BarSizeInLbs.fourtyFive.asInt()
        }
    }
}

extension WeightSelectionViewController {
    
    func establishSubviews() {
        //Set up directionsLabel
        view.addSubview(directionsLabel)
        directionsLabel.text = "How much weight do you want to lift?"
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
        unitSelector.translatesAutoresizingMaskIntoConstraints = false
        unitSelector.apportionsSegmentWidthsByContent = true
        unitSelector.selectedSegmentIndex = 0
        unitSelector.addTarget(self, action: #selector(updateBarSizeOptions), for: .valueChanged)
        unitSelector.addTarget(self, action: #selector(unitsSetTo), for: .valueChanged)

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
        barSpacerView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barSpacerView1)

        barSpacerView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barSpacerView2)
        
        view.addSubview(barLabel)
        barLabel.translatesAutoresizingMaskIntoConstraints = false
        barLabel.text = "Bar Size"
        barLabel.textColor = .black
        barLabel.backgroundColor = .white
        
        view.addSubview(barSelector)
        barSelector.apportionsSegmentWidthsByContent = true
        barSelector.selectedSegmentIndex = 0
        barSelector.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(barSelectionStackView)
        barSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        barSelectionStackView.alignment = .fill
        barSelectionStackView.axis = .horizontal
        barSelectionStackView.distribution = .equalSpacing
        barSelectionStackView.backgroundColor = .white
        barSelectionStackView.addArrangedSubview(barSpacerView1)
        barSelectionStackView.addArrangedSubview(barLabel)
        barSelectionStackView.addArrangedSubview(barSelector)
        barSelectionStackView.addArrangedSubview(barSpacerView2)
        
        //Set up allOptionsStackView
        view.addSubview(allOptionsStackView)
        allOptionsStackView.translatesAutoresizingMaskIntoConstraints = false
        allOptionsStackView.axis = .vertical
        allOptionsStackView.alignment = .fill
        allOptionsStackView.distribution = .equalCentering
        allOptionsStackView.addArrangedSubview(weightSelectionStackView)
        allOptionsStackView.addArrangedSubview(unitSelectionStackView)
        allOptionsStackView.addArrangedSubview(barSelectionStackView)
        
        //Set up button
        view.addSubview(submitButton)
        submitButton.setTitle("Show me how to load it", for: UIControl.State.normal)
        submitButton.titleLabel?.textColor = .black
        submitButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        submitButton.backgroundColor = .systemTeal
        submitButton.layer.cornerRadius = 4
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            directionsLabel.bottomAnchor.constraint(equalTo: allOptionsStackView.topAnchor, constant: -30),
            directionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            directionsLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
            directionsLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -30),
            
            weightTextField.widthAnchor.constraint(equalToConstant: 130),
            weightTextField.heightAnchor.constraint(equalToConstant: 30),
            
            allOptionsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allOptionsStackView.heightAnchor.constraint(equalToConstant: 140),
            allOptionsStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 40),
            allOptionsStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -40),
            
            submitButton.topAnchor.constraint(equalTo: barSelectionStackView.bottomAnchor, constant: 30),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalTo: directionsLabel.widthAnchor, multiplier: 0.8),
        ])
    }
}
