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
    
    private var quantity45LbPlates: Int = 0
    private var quantity25LbPlates: Int = 0
    private var quantity10LbPlates: Int = 0
    private var quantity5LbPlates: Int = 0
    private var quantity2_5LbPlates: Int = 0
    
    
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
    
    // TODO: Create helper class or struct called "PlateMathCalculator"
    func doPlateMath(weight: Int) {
        let totalPlateWeight = weight - 45
        var remainderAfter45s = 0
        var remainderAfter25s = 0
        var remainderAfter10s = 0
        var remainderAfter5s = 0
        
        //These blocks can use .isMultipleOf instead of % once I update Xcode to the latest version of swift
        // TODO: Try extracting the logic of the conditional blocks such that it is repeatable between blocks (taking remainder and quantity of prev block as arguments)?
        if Int(totalPlateWeight / 45) % 2 == 0 {
            quantity45LbPlates = Int(totalPlateWeight / 45)
            remainderAfter45s = totalPlateWeight % 45
        } else {
            quantity45LbPlates = Int(totalPlateWeight / 45) - 1
            remainderAfter45s = totalPlateWeight % 45 + 45
        }
    
        if Int(remainderAfter45s / 25) % 2 == 0 {
            quantity25LbPlates = Int(remainderAfter45s / 25)
            remainderAfter25s = remainderAfter45s % 25
        } else {
            quantity25LbPlates = Int(remainderAfter45s / 25) - 1
            remainderAfter25s = remainderAfter45s % 25 + 25
        }
        
        if Int(remainderAfter25s / 10) % 2 == 0 {
            quantity10LbPlates = Int(remainderAfter25s / 10)
            remainderAfter10s = remainderAfter25s % 10
        } else {
            quantity10LbPlates = Int(remainderAfter25s / 10) - 1
            remainderAfter10s = remainderAfter25s % 10 + 10
        }
        
        if Int(remainderAfter10s / 5) % 2 == 0 {
            quantity5LbPlates = Int(remainderAfter10s / 5)
            remainderAfter5s = remainderAfter10s % 5
        } else {
            quantity5LbPlates = Int(remainderAfter10s / 5) - 1
            remainderAfter5s = remainderAfter10s % 5 + 5
        }
        
        quantity2_5LbPlates = Int(Double(remainderAfter5s) / 2.5)
    }
    
    func updateLabels() {
        text45LbPlates.text = "(\(quantity45LbPlates)) 45lb plates"
        text25LbPlates.text = "(\(quantity25LbPlates)) 25lb plates"
        text10LbPlates.text = "(\(quantity10LbPlates)) 10lb plates"
        text5LbPlates.text = "(\(quantity5LbPlates)) 5lb plates"
        text2_5LbPlates.text = "(\(quantity2_5LbPlates)) 2.5lb plates"
    }
    
    @objc func submit(_ answer: String) {
        totalWeight = Int(answer)!
        //answer should be an INT. Do I validate this here, or in promptForWeight?
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

