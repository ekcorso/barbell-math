//
//  ViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 10/20/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

class PlateCountViewController: UIViewController {
    // MARK: - Properties
    var totalWeight: Double {
        return searchData?.weight ?? 0.0
    }
    var barWeight: Int {
        return searchData?.barWeight ?? BarSizeInLbs.fourtyFive.asInt()
    }
    var units: String {
        return searchData?.units ?? Units.lbs.rawValue
    }
    var quantityOfCats: Double = 0
    var plateQuantityText: String?
    var searchData: SearchData?
    
    // MARK: UI Properties
    lazy var plateLabelsView: UIView = {
        var plateLabelsView = UIView()
        plateLabelsView.translatesAutoresizingMaskIntoConstraints = false
        plateLabelsView.backgroundColor = .systemBackground
        view.addSubview(plateLabelsView)
        return plateLabelsView
    }()
    
    lazy var explanationLabel: UILabel = {
        var explanationLabel = UILabel()
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.textColor = .label
        explanationLabel.textAlignment = .center
        explanationLabel.text = "Here's what you'll need to load \(Int(totalWeight))\(units) with a \(barWeight)\(units) bar:"
        explanationLabel.numberOfLines = 0
        view.addSubview(explanationLabel)
        return explanationLabel
    }()

    lazy var plateWeightsLabel: UILabel = {
        var plateWeightsLabel = UILabel()
        plateWeightsLabel.translatesAutoresizingMaskIntoConstraints = false
        plateWeightsLabel.textColor = .label
        plateWeightsLabel.textAlignment = .justified
        plateWeightsLabel.numberOfLines = 0
        view.addSubview(plateWeightsLabel)
        return plateWeightsLabel
    }()
    
    lazy var catLabel: UILabel = {
        var catLabel = UILabel()
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.textColor = .label
        catLabel.textAlignment = .center
        catLabel.numberOfLines = 0
        catLabel.font = .italicSystemFont(ofSize: explanationLabel.font.pointSize)
        catLabel.text = "Pick this up and you'll be lifting the weight of \(PlateMathCalculator().findThisWeightInCats(totalWeight: totalWeight)) cats."
        view.addSubview(catLabel)
        return catLabel
    }()
    
    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "confetti-gym-mats")!)
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain , target: nil, action: nil)
        //Add action for back button that clears the previous vc?
        
        var plateMathCalculator = PlateMathCalculator()
        if units == Units.lbs.rawValue {
            let plateQuantities = plateMathCalculator.doPlateMathInLbs(totalWeight:totalWeight, barWeight: barWeight)
            updateLabelsForLbs(plateQuantities: plateQuantities)
        } else {
            let plateQuantities = plateMathCalculator.doPlateMathInKgs(totalWeight: totalWeight, barWeight: barWeight)
            updateLabelsForKgs(plateQuantities: plateQuantities)
        }
    }
    
    // MARK: Actions
    
    func updateLabelsForLbs(plateQuantities: BarLoadInLbs) {
        
        plateQuantityText = """
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
    
    func updateLabelsForKgs(plateQuantities: BarLoadInKgs) {
        
        plateQuantityText = """
                    (\(Int(plateQuantities.quantity20KgPlates))) 20kg plates
                    (\(Int(plateQuantities.quantity15KgPlates))) 15kg plates
                    (\(Int(plateQuantities.quantity10KgPlates))) 10kg plates
                    (\(Int(plateQuantities.quantity5KgPlates))) 5kg plates
                    (\(Int(plateQuantities.quantity2_5KgPlates))) 2.5kg plates
                    (\(Int(plateQuantities.quantity1_25KgPlates))) 1.25kg plates
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
    
    // MARK: UI Constraints
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

