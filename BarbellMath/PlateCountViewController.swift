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
    var plateQuantityText: String?
    
    var plateLabelsView = UIView()
    var plateWeightsLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "confetti-gym-mats")!)
        establishSubviews()
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain , target: nil, action: nil)
        
        var plateMathCalculator = PlateMathCalculator()
        if let totalWeight = totalWeight {
            let plateMathQuantitites = plateMathCalculator.doPlateMath(totalWeight: totalWeight)
            updateLabels(plateQuantities: plateMathQuantitites)
        } else {
            print("Total weight is nil")
        }
    }

    
    func updateLabels(plateQuantities: PlateQuantities) {
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
            let font = UIFont.systemFont(ofSize: 20)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .paragraphStyle: paragraphStyle
            ]
            let attributedPlateWeightString = NSAttributedString(string: plateQuantityText, attributes: attributes)
            plateWeightsLabel.attributedText = attributedPlateWeightString
        }
    }
}

extension PlateCountViewController {
    
    func establishSubviews() {
//        plateLabelsView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(plateLabelsView)
        
        plateWeightsLabel.translatesAutoresizingMaskIntoConstraints = false
        plateWeightsLabel.textColor = .black
        plateWeightsLabel.backgroundColor = .white
        plateWeightsLabel.numberOfLines = 0
        view.addSubview(plateWeightsLabel)
    }
    
    func setConstraints() {
        let horizontalPadding: CGFloat = 50.0
        let verticalPadding: CGFloat = 100
        
        NSLayoutConstraint.activate([
            
            plateWeightsLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: verticalPadding),
            plateWeightsLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: horizontalPadding),
            plateWeightsLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -verticalPadding),
            plateWeightsLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -horizontalPadding),
            
//            plateLabelsView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: verticalPadding),
//            plateLabelsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: horizontalPadding),
//            plateLabelsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -verticalPadding),
//            plateLabelsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -horizontalPadding),
        ])
    }
}

