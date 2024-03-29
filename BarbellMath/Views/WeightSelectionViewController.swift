//
//  WeightSelectionViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 5/28/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class WeightSelectionViewController: UIViewController {
    var allSearches: [SearchData]?
    
    // MARK: - UI Properties
    
    lazy var directionsLabel: UILabel = {
        var directionsLabel = UILabel()
        directionsLabel.text = "How much weight do you want to lift?"
        directionsLabel.textColor = .label
        directionsLabel.textAlignment = .center
        directionsLabel.numberOfLines = 0
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(directionsLabel)
        return directionsLabel
    }()
    
    lazy var allOptionsStackView: UIStackView = {
        let allOptionsStackView = UIStackView()
        view.addSubview(allOptionsStackView)
        allOptionsStackView.translatesAutoresizingMaskIntoConstraints = false
        allOptionsStackView.axis = .vertical
        allOptionsStackView.alignment = .fill
        allOptionsStackView.distribution = .equalCentering
        allOptionsStackView.addArrangedSubview(weightSelectionStackView)
        allOptionsStackView.addArrangedSubview(unitSelectionStackView)
        allOptionsStackView.addArrangedSubview(barSelectionStackView)
        return allOptionsStackView
    }()
    
    //Set up unitSelectionStackView and it's subviews
    lazy var unitSelectionStackView: UIStackView = {
        let unitSelectionStackView = UIStackView()
        view.addSubview(unitSelectionStackView)
        unitSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        unitSelectionStackView.alignment = .fill
        unitSelectionStackView.axis = .horizontal
        unitSelectionStackView.distribution = .equalSpacing
        unitSelectionStackView.backgroundColor = .systemBackground
        unitSelectionStackView.addArrangedSubview(unitSpacerView1)
        unitSelectionStackView.addArrangedSubview(unitLabel)
        unitSelectionStackView.addArrangedSubview(unitSelector)
        unitSelectionStackView.addArrangedSubview(unitSpacerView2)
        return unitSelectionStackView
    }()
    
    lazy var unitLabel: UILabel = {
        let unitLabel = UILabel()
        view.addSubview(unitLabel)
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.text = "Units"
        unitLabel.textColor = .label
        unitLabel.backgroundColor = .systemBackground
        return unitLabel
    }()

    lazy var unitSelector: UISegmentedControl = {
        var unitSelector = UISegmentedControl(items: [Units.lbs.rawValue, Units.kgs.rawValue])
        view.addSubview(unitSelector)
        unitSelector.translatesAutoresizingMaskIntoConstraints = false
        unitSelector.apportionsSegmentWidthsByContent = true
        unitSelector.addTarget(self, action: #selector(updateBarSizeOptions), for: .valueChanged)
        unitSelector.addTarget(self, action: #selector(unitsSetTo), for: .valueChanged)
        
        if UserDefaults.standard.value(forKey: "units") as! String == Units.lbs.rawValue {
            unitSelector.selectedSegmentIndex = Int.lbsIndex
        } else {
            unitSelector.selectedSegmentIndex = Int.kgsIndex
        }
        
        return unitSelector
    }()

    lazy var unitSpacerView1: UIView = {
        let unitSpacerView1 = UIView()
        unitSpacerView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unitSpacerView1)
        return unitSpacerView1
    }()
    
    lazy var unitSpacerView2: UIView = {
        let unitSpacerView2 = UIView()
        unitSpacerView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unitSpacerView2)
        return unitSpacerView2
    }()
    
    //Set up weightSelectionStackView and it's subviews
    lazy var weightSelectionStackView: UIStackView = {
        let weightSelectionStackView = UIStackView()
        view.addSubview(weightSelectionStackView)
        weightSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        weightSelectionStackView.alignment = .fill
        weightSelectionStackView.axis = .horizontal
        weightSelectionStackView.distribution = .equalSpacing
        weightSelectionStackView.addArrangedSubview(weightSpacerView1)
        weightSelectionStackView.addArrangedSubview(weightLabel)
        weightSelectionStackView.addArrangedSubview(weightTextField)
        weightSelectionStackView.addArrangedSubview(weightSpacerView2)
        return weightSelectionStackView
    }()
    
    lazy var weightLabel: UILabel = {
        let weightLabel = UILabel()
        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.text = "Total Weight"
        weightLabel.textAlignment = .left
        weightLabel.textColor = .label
        weightLabel.backgroundColor = .systemBackground
        return weightLabel
    }()
    
    lazy var weightTextField: UITextField = {
        let weightTextField = UITextField()
        view.addSubview(weightTextField)
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.placeholder = "Weight"
        //weightTextField.layer.cornerRadius = 10
        weightTextField.textAlignment = .center
        weightTextField.textColor = .label
        weightTextField.borderStyle = .roundedRect
        weightTextField.backgroundColor = .systemGray6
        weightTextField.keyboardType = .numberPad

        
        return weightTextField
        }()
    
    lazy var weightSpacerView1: UIView = {
        let weightSpacerView1 = UIView()
        view.addSubview(weightSpacerView1)
        weightSpacerView1.translatesAutoresizingMaskIntoConstraints = false
        return weightSpacerView1
    }()
    
    lazy var weightSpacerView2: UIView = {
        let weightSpacerView2 = UIView()
        view.addSubview(weightSpacerView2)
        weightSpacerView2.translatesAutoresizingMaskIntoConstraints = false
        return weightSpacerView2
    }()
    
    //Set up barSelectionStackView and it's subviews
    lazy var barSelectionStackView: UIStackView = {
        let barSelectionStackView = UIStackView()
        view.addSubview(barSelectionStackView)
        barSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        barSelectionStackView.alignment = .fill
        barSelectionStackView.axis = .horizontal
        barSelectionStackView.distribution = .equalSpacing
        barSelectionStackView.backgroundColor = .systemBackground
        barSelectionStackView.addArrangedSubview(barSpacerView1)
        barSelectionStackView.addArrangedSubview(barLabel)
        barSelectionStackView.addArrangedSubview(barSelector)
        barSelectionStackView.addArrangedSubview(barSpacerView2)
        return barSelectionStackView
    }()
        
    lazy var barLabel: UILabel = {
        let barLabel = UILabel()
        view.addSubview(barLabel)
        barLabel.translatesAutoresizingMaskIntoConstraints = false
        barLabel.text = "Bar Size"
        barLabel.textColor = .label
        barLabel.backgroundColor = .systemBackground
        return barLabel
    }()
    
    let barSelectorItemsInLbs = [BarSizeInLbs.fourtyFive.asString(), BarSizeInLbs.thirtyFive.asString()]
    let barSelectorItemsInKgs = [BarSizeInKilos.twenty.asString(), BarSizeInKilos.fifteen.asString()]
    
    lazy var barSelector: UISegmentedControl = {
        var barSelector = UISegmentedControl(items: [])
        
        barSelector.apportionsSegmentWidthsByContent = true
        barSelector.translatesAutoresizingMaskIntoConstraints = false
        
        //Set default units selection
        if unitsSetTo() == Units.lbs.rawValue {
            barSelector = UISegmentedControl(items: barSelectorItemsInLbs)
        } else {
            barSelector = UISegmentedControl(items: barSelectorItemsInKgs)
        }
        barSelector.selectedSegmentIndex = 0
        
        view.addSubview(barSelector)
        return barSelector
    }()
    
    lazy var barSpacerView1: UIView = {
        let barSpacerView1 = UIView()
        barSpacerView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barSpacerView1)
        return barSpacerView1
    }()
    
    lazy var barSpacerView2: UIView = {
        let barSpacerView2 = UIView()
        barSpacerView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(barSpacerView2)
        return barSpacerView2
    }()
    
    lazy var submitButton: UIButton = {
        let submitButton = UIButton()
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Show me how to load it", for: UIControl.State.normal)
        submitButton.titleLabel?.textColor = .white
        submitButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        submitButton.backgroundColor = .systemTeal
        submitButton.layer.cornerRadius = 8
        submitButton.addTarget(self, action: #selector(submitUserSelections), for: .touchUpInside)
        return submitButton
    }()
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Barbell Math"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.allSearches = DataStorage().retrieve()
    }
    
    // MARK: - Actions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @objc func submitUserSelections() {
        let viewController = PlateCountViewController()
        let validator = Validator()
        var searchData = SearchData()
        
        guard let userEntry = weightTextField.text else {
            let weightMustNotNBeEmptyAlert = validator.showAlert(message: "Weight field must not be empty.")
            self.present(weightMustNotNBeEmptyAlert, animated: true)
            return
        }
        
        guard validator.isWholeNumber(userEntry: userEntry) else {
            let mustBeAnIntAlert = validator.showAlert(message: "Weight must be entered as an integer value.")
            self.present(mustBeAnIntAlert, animated: true)
            return
        }
        
        guard validator.isMultipleOf5(userEntry: userEntry) else {
            let mustBeMultpleOf5Alert = validator.showAlert(message: "Weight must be a multiple of 5.")
            self.present(mustBeMultpleOf5Alert, animated: true)
            return
        }
        
        guard validator.isAtLeast50lbs(userEntry: userEntry) else {
            if unitsSetTo() == "lbs" {
                let mustLiftMoreWeightAlert = validator.showAlert(message: "Weight must be at least 50lbs.")
                self.present(mustLiftMoreWeightAlert, animated: true)
            } else if unitsSetTo() == "kgs" {
                let mustLiftMoreWeightAlert = validator.showAlert(message: "Weight must be at least 110kgs.")
                self.present(mustLiftMoreWeightAlert, animated: true)
            }
            return
        }
            
        searchData.barWeight = barSetTo()
        searchData.units = unitsSetTo()
        searchData.weight = Double(userEntry)
        
        if allSearches != nil {
            self.allSearches!.insert(searchData, at: 0)
        } else {
            allSearches = [searchData]
        }
        
        if let allSearches = allSearches {
            do {
                try DataStorage().save(searchData: allSearches)
            } catch {
                print("Save failed in WSVC submit")
            }
        }
        
        viewController.searchData = searchData
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func unitsSetTo() -> String {
        switch unitSelector.selectedSegmentIndex {
        case .lbsIndex:
            UserDefaults.standard.set(Units.lbs.rawValue, forKey: "units")
            return Units.lbs.rawValue
        case .kgsIndex:
            UserDefaults.standard.set(Units.kgs.rawValue, forKey: "units")
            return Units.kgs.rawValue
        default:
            print("This unit selection is unhandled")
            return Units.lbs.rawValue
        }
    }
    
    @objc func updateBarSizeOptions() {
        switch unitsSetTo() {
        case Units.lbs.rawValue:
            barSelector.removeAllSegments()
            barSelector.insertSegment(withTitle: BarSizeInLbs.fourtyFive.asString(), at: 0, animated: false)
            barSelector.insertSegment(withTitle: BarSizeInLbs.thirtyFive.asString(), at: 1, animated: false)
            barSelector.selectedSegmentIndex = 0
        case Units.kgs.rawValue:
            barSelector.removeAllSegments()
            barSelector.insertSegment(withTitle: BarSizeInKilos.twenty.asString(), at: 0, animated: false)
            barSelector.insertSegment(withTitle: BarSizeInKilos.fifteen.asString(), at: 1, animated: false)
            barSelector.selectedSegmentIndex = 0
        default:
            print("This unit selection is unhandled")
        }
    }
    
    @objc func barSetTo() -> Int {
        switch barSelector.selectedSegmentIndex {
        case .standardBarSizeIndex:
            if unitsSetTo() == Units.lbs.rawValue {
                return BarSizeInLbs.fourtyFive.asInt()
            } else {
                return BarSizeInKilos.twenty.asInt()
            }
        case .smallerBarSizeIndex:
            if unitsSetTo() == Units.lbs.rawValue {
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

// MARK: - UI Constraints
extension WeightSelectionViewController {
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

private extension Int {
    static var lbsIndex = 0
    static var kgsIndex = 1
    
    static var standardBarSizeIndex = 0
    static var smallerBarSizeIndex = 1
}
