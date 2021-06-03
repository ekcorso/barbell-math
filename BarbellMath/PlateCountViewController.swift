//
//  ViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 10/20/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

class PlateCountViewController: UIViewController {
    
    var totalWeight: Double = 0
    //should this be nil instead of 0? How would using an optional value here change things? See temp app...? Mike says I could solve this with a "guard let" statement (if total weight is 0) in the plate math func instead. Look up guard statements.
    
    var plateLabelsView: UIView!

    var text45LbPlates: UILabel!
    var text25LbPlates: UILabel!
    var text10LbPlates: UILabel!
    var text5LbPlates: UILabel!
    var text2_5LbPlates: UILabel!
    
    private let horizontalPadding: CGFloat = 50.0
    private let verticalPadding: CGFloat = 100
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "confetti-gym-mats")!)
        establishSubviews()
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Plate Calculator"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(promptForWeight))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(setStartingValues))
        
        var plateMathCalculator = PlateMathCalculator()
        let plateMathQuantitites = plateMathCalculator.doPlateMath(totalWeight: totalWeight)
        updateLabels(plateQuantities: plateMathQuantitites)
    }
    
    @objc func promptForWeight() {
        let alert = UIAlertController(title: "Enter the amount of weight you're going to lift", message: "(Feeling pretty cocky right now huh?)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self, alert] action in
            if let answerField = alert.textFields?[0],
                let answer = answerField.text,
                let doubleAnswer = Double(answer) {
                    self.submit(doubleAnswer)
            } else {
                assertionFailure("Failed to unwrap answer.")
            }
        }
        
        alert.addAction(submitAction)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Your weight in pounds here"
        })
        
        self.present(alert, animated: true)
    }
    
    func updateLabels(plateQuantities: PlateQuantities) {
        text45LbPlates.text = "(\(Int(plateQuantities.quantity45LbPlates))) 45lb plates"
        text25LbPlates.text = "(\(Int(plateQuantities.quantity25LbPlates))) 25lb plates"
        text10LbPlates.text = "(\(Int(plateQuantities.quantity10LbPlates))) 10lb plates"
        text5LbPlates.text = "(\(Int(plateQuantities.quantity5LbPlates))) 5lb plates"
        text2_5LbPlates.text = "(\(Int(plateQuantities.quantity2_5LbPlates))) 2.5lb plates"
    }
    
    @objc func submit(_ answer: Double) {
        let totalWeight = answer
        //answer should be an Num. Do I validate this here, or in promptForWeight?
        var plateMathCalculator = PlateMathCalculator()
        let plateQuantities = plateMathCalculator.doPlateMath(totalWeight: totalWeight)
        updateLabels(plateQuantities: plateQuantities)
    }
    
    @objc func setStartingValues() {
        text2_5LbPlates.text = "(0) 2.5lb plates"
        text5LbPlates.text = "(0) 5lb plates"
        text10LbPlates.text = "(0) 10lb plates"
        text25LbPlates.text = "(0) 25lb plates"
        text45LbPlates.text = "(0) 45lb plates"
    }
}

extension PlateCountViewController {
    func establishSubviews() {
        plateLabelsView = UIView()
        plateLabelsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plateLabelsView)
        
        text2_5LbPlates = UILabel()
        text2_5LbPlates.text = "(0) 2.5lb plates"
        text2_5LbPlates.textAlignment = .center
        text2_5LbPlates.backgroundColor = .white
        text2_5LbPlates.textColor = .black
        text2_5LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text2_5LbPlates)
        
        text5LbPlates = UILabel()
        text5LbPlates.text = "(0) 5lb plates"
        text5LbPlates.textAlignment = .center
        text5LbPlates.textColor = .black
        text5LbPlates.backgroundColor = .white
        text5LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text5LbPlates)
        
        text10LbPlates = UILabel()
        text10LbPlates.text = "(0) 10lb plates"
        text10LbPlates.textAlignment = .center
        text10LbPlates.backgroundColor = .white
        text10LbPlates.textColor = .black
        text10LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text10LbPlates)
        
        text25LbPlates = UILabel()
        text25LbPlates.text = "(0) 25lb plates"
        text25LbPlates.textAlignment = .center
        text25LbPlates.backgroundColor = .white
        text25LbPlates.textColor = .black
        text25LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text25LbPlates)
        
        text45LbPlates = UILabel()
        text45LbPlates.text = "(0) 45lb plates"
        text45LbPlates.textAlignment = .center
        text45LbPlates.textColor = .black
        text45LbPlates.backgroundColor = .white
        text45LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text45LbPlates)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            plateLabelsView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: verticalPadding),
            plateLabelsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: horizontalPadding),
            plateLabelsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -verticalPadding),
            plateLabelsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -horizontalPadding),
            
            text45LbPlates.topAnchor.constraint(equalTo: plateLabelsView.topAnchor),
            text45LbPlates.leadingAnchor.constraint(equalTo: plateLabelsView.leadingAnchor),
            text45LbPlates.trailingAnchor.constraint(equalTo: plateLabelsView.trailingAnchor),
            
            text25LbPlates.topAnchor.constraint(equalTo: text45LbPlates.bottomAnchor),
            text25LbPlates.leadingAnchor.constraint(equalTo: plateLabelsView.leadingAnchor),
            text25LbPlates.trailingAnchor.constraint(equalTo: plateLabelsView.trailingAnchor),
            
            text10LbPlates.topAnchor.constraint(equalTo: text25LbPlates.bottomAnchor),
            text10LbPlates.leadingAnchor.constraint(equalTo: plateLabelsView.leadingAnchor),
            text10LbPlates.trailingAnchor.constraint(equalTo: plateLabelsView.trailingAnchor),
            
            text5LbPlates.topAnchor.constraint(equalTo: text10LbPlates.bottomAnchor),
            text5LbPlates.leadingAnchor.constraint(equalTo: plateLabelsView.leadingAnchor),
            text5LbPlates.trailingAnchor.constraint(equalTo: plateLabelsView.trailingAnchor),
            
            text2_5LbPlates.topAnchor.constraint(equalTo: text5LbPlates.bottomAnchor),
            text2_5LbPlates.leadingAnchor.constraint(equalTo: plateLabelsView.leadingAnchor),
            text2_5LbPlates.trailingAnchor.constraint(equalTo: plateLabelsView.trailingAnchor),
            text2_5LbPlates.bottomAnchor.constraint(equalTo: plateLabelsView.bottomAnchor),
            
            text45LbPlates.heightAnchor.constraint(equalTo: plateLabelsView.heightAnchor, multiplier: 1/5),
            text25LbPlates.heightAnchor.constraint(equalTo: plateLabelsView.heightAnchor, multiplier: 1/5),
            text10LbPlates.heightAnchor.constraint(equalTo: plateLabelsView.heightAnchor, multiplier: 1/5),
            text5LbPlates.heightAnchor.constraint(equalTo: plateLabelsView.heightAnchor, multiplier: 1/5),
            text2_5LbPlates.heightAnchor.constraint(equalTo: plateLabelsView.heightAnchor, multiplier: 1/5),
        ])
    }
}

