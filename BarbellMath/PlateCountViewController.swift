//
//  ViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 10/20/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

class PlateCountViewController: UIViewController {
    
    var totalWeight: Double? = 0
    var barWeight: Int = BarSizeInLbs.fourtyFive.asInt()
    var unit: String = Units.lb.rawValue
    var quantityOfCats: Double = 0
    var plateQuantityText: String?
    
    var explanationLabel = UILabel()
    var plateLabelsView = UIView()
    var plateWeightsLabel = UILabel()
    var catLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "confetti-gym-mats")!)
        establishSubviews()
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain , target: nil, action: nil)
        //Add action for back button that clears the previous vc?
        
        var plateMathCalculator = PlateMathCalculator()
        if let totalWeight = totalWeight {
            let plateMathQuantitites = plateMathCalculator.doPlateMath(totalWeight: totalWeight)
            updateLabels(plateQuantities: plateMathQuantitites)
        } else {
            print("Total weight is nil")
        }
    }
    
    func findThisWeightInCats(totalWeight: Double?) -> Int {
        var weightInCats = 0.0
        if let totalWeight = totalWeight {
            weightInCats = totalWeight / 9.0
            return Int(weightInCats)
        } else {
            return Int(weightInCats)
        }
    }
    
    func updateLabels(plateQuantities: LbPlateQuantities) {
        plateQuantityText =
            """
                (\(Int(plateQuantities.quantity45LbPlates))) 45lb plates
                (\(Int(plateQuantities.quantity25LbPlates))) 25lb plates
                (\(Int(plateQuantities.quantity10LbPlates))) 10lb plates
                (\(Int(plateQuantities.quantity5LbPlates))) 5lb plates
                (\(Int(plateQuantities.quantity2_5LbPlates))) 2.5lb plates
            """
        
        if let plateQuantityText = plateQuantityText {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 15
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: paragraphStyle
            ]
            let attributedPlateQuantityString = NSAttributedString(string: plateQuantityText, attributes: attributes)
            plateWeightsLabel.attributedText = attributedPlateQuantityString
        }
    }
}

extension PlateCountViewController {
    
    func establishSubviews() {
        plateLabelsView.translatesAutoresizingMaskIntoConstraints = false
        plateLabelsView.backgroundColor = .white
        view.addSubview(plateLabelsView)
        
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.textColor = .black
        explanationLabel.textAlignment = .center
        explanationLabel.text = "Here's what you'll need to load \(Int(totalWeight ?? 0))\(unit) with a \(barWeight)\(unit) bar:"
        explanationLabel.numberOfLines = 0
        view.addSubview(explanationLabel)
        
        plateWeightsLabel.translatesAutoresizingMaskIntoConstraints = false
        plateWeightsLabel.textColor = .black
        plateWeightsLabel.textAlignment = .justified
        plateWeightsLabel.numberOfLines = 0
        view.addSubview(plateWeightsLabel)
        
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.textColor = .black
        catLabel.textAlignment = .center
        catLabel.numberOfLines = 0
        catLabel.text = "Pick this up and you'll be lifting the weight of \(findThisWeightInCats(totalWeight: totalWeight)) cats."
        view.addSubview(catLabel)
    }
    
    func setConstraints() {
        let verticalPadding: CGFloat = 50
        
        NSLayoutConstraint.activate([
            
            plateLabelsView.topAnchor.constraint(equalTo: explanationLabel.topAnchor, constant: -verticalPadding),
            plateLabelsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            plateLabelsView.bottomAnchor.constraint(equalTo: catLabel.bottomAnchor, constant: verticalPadding),
            plateLabelsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            explanationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            explanationLabel.bottomAnchor.constraint(equalTo: plateWeightsLabel.topAnchor, constant: -30),
            explanationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            plateWeightsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plateWeightsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            catLabel.topAnchor.constraint(equalTo: plateWeightsLabel.bottomAnchor, constant: 30),
            catLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catLabel.widthAnchor.constraint(equalTo: explanationLabel.widthAnchor),
        ])
    }
}

