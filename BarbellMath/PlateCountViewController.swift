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
    //should this be nil instead of 0? How would using an optional value here change things? See temp app...? Mike says I could solve this with a "guard let" statement (if total weight is 0) in the math func instead. Look up guard statements.
    
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
            let answer = alert.textFields![0]
            self.submit(answer.text!)
        }
        
        alert.addAction(submitAction)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Your weight in pounds here"
        })
        
        self.present(alert, animated: true)
    }
    
    // TODO: Instantiate the PlateCalculator, then call it's funcs to return values that updateLabels can use
    func updateLabels() {
        text45LbPlates.text = "(\(quantity45LbPlates)) 45lb plates"
        text25LbPlates.text = "(\(quantity25LbPlates)) 25lb plates"
        text10LbPlates.text = "(\(quantity10LbPlates)) 10lb plates"
        text5LbPlates.text = "(\(quantity5LbPlates)) 5lb plates"
        text2_5LbPlates.text = "(\(quantity2_5LbPlates)) 2.5lb plates"
    }
    
    @objc func submit(_ answer: String) {
        totalWeight = Double(answer)!
        //OLD: answer should be an INT. Do I validate this here, or in promptForWeight?
        //NEW: answer should be CONVERTED to a double so that plate math can handleit
        doPlateMath(weight: totalWeight)
        updateLabels()
    }
    
    @objc func setStartingValues() {
        text45LbPlates.text = "(0) 45lb plates"
        text25LbPlates.text = "(0) 25lb plates"
        text10LbPlates.text = "(0) 10lb plates"
        text5LbPlates.text = "(0) 5lb plates"
        text2_5LbPlates.text = "(0) 2.5lb plates"
    }

}

