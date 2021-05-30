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
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
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
        plateLabelsView.backgroundColor = .lightGray
        plateLabelsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plateLabelsView)
        
        text2_5LbPlates = UILabel()
        text2_5LbPlates.text = "(0) 2.5lb plates"
        text2_5LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text2_5LbPlates)
        
        text5LbPlates = UILabel()
        text5LbPlates.text = "(0) 5lb plates"
        text5LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text5LbPlates)
        
        text10LbPlates = UILabel()
        text10LbPlates.text = "(0) 10lb plates"
        text10LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text10LbPlates)
        
        text25LbPlates = UILabel()
        text25LbPlates.text = "(0) 25lb plates"
        text25LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text25LbPlates)
        
        text45LbPlates = UILabel()
        text45LbPlates.text = "(0) 45lb plates"
        text45LbPlates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text45LbPlates)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            plateLabelsView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            plateLabelsView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
            plateLabelsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            plateLabelsView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            
            text45LbPlates.topAnchor.constraint(equalTo: plateLabelsView.layoutMarginsGuide.topAnchor),
            text45LbPlates.centerXAnchor.constraint(equalTo: plateLabelsView.layoutMarginsGuide.centerXAnchor),
            
            text25LbPlates.topAnchor.constraint(equalTo: text45LbPlates.bottomAnchor, constant: 10),
            text25LbPlates.centerXAnchor.constraint(equalTo: plateLabelsView.layoutMarginsGuide.centerXAnchor),
            
            text10LbPlates.topAnchor.constraint(equalTo: text25LbPlates.bottomAnchor, constant: 10),
            text10LbPlates.centerXAnchor.constraint(equalTo: plateLabelsView.layoutMarginsGuide.centerXAnchor),
            
            text5LbPlates.topAnchor.constraint(equalTo: text10LbPlates.bottomAnchor, constant: 10),
            text5LbPlates.centerXAnchor.constraint(equalTo: plateLabelsView.layoutMarginsGuide.centerXAnchor),
            
            text2_5LbPlates.topAnchor.constraint(equalTo: text5LbPlates.bottomAnchor, constant: 10),
            text2_5LbPlates.centerXAnchor.constraint(equalTo: plateLabelsView.layoutMarginsGuide.centerXAnchor),

        ])
    }
}

