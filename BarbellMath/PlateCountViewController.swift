//
//  ViewController.swift
//  BarbellMath
//
//  Created by Emily Corso on 10/20/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

class PlateCountViewController: UIViewController {
    
    var totalWeight: Int = 0
    //should this be nil instead of 0? How would using an optional value here change things? See temp app...? Mike says I could solve this with a "guard let" statement (if total weight is 0) in the plate math func instead. Look up guard statements.
    
    @IBOutlet weak var text45LbPlates: UILabel!
    @IBOutlet weak var text25LbPlates: UILabel!
    @IBOutlet weak var text10LbPlates: UILabel!
    @IBOutlet weak var text5LbPlates: UILabel!
    @IBOutlet weak var text2_5LbPlates: UILabel!
    //variable names could be better. Ideally would not refer to the datatype in the name.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Plate Calculator"
        
        setStartingValues()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(promptForWeight))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(setStartingValues))
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
        text45LbPlates.text = "(0) 45lb plates"
        text25LbPlates.text = "(0) 25lb plates"
        text10LbPlates.text = "(0) 10lb plates"
        text5LbPlates.text = "(0) 5lb plates"
        text2_5LbPlates.text = "(0) 2.5lb plates"
    }

}

