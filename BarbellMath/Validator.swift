//
//  Validator.swift
//  BarbellMath
//
//  Created by Emily Corso on 7/17/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

//Start submit func by unwrapping weightTextField.text (String?), possibly with a guard statement or if let block so the rest of these checks can take an unwrapped String

//Set the following values in WSVC if all checks pass
//                viewController.totalWeight = Double(userEntry)
//                viewController.units = unitsSetTo()
//                viewController.barWeight = barSetTo()

//Create an enum of Validator func names so I can switch on these in WSVC without providing a default?

class Validator {
    
//    func fieldHasText(userEntry: String?) -> Bool {
//        if let _ = userEntry {
//            return true
//        } else {
//            return false
//        }
//    }
    
    func isNumeric(userEntry: String) -> Bool {
        if let _ = Double(userEntry) {
            return true
        } else {
            return false
        }
    }
    
    func isWholeNumber(userEntry: String?) -> Bool {
        
        return false
    }
    
    func isMultipleOf5(userEntry: String?) -> Bool {
        
        return false
    }
    
    func isAtLeast50lbs(userEntry: String?) -> Bool {
        
        return false
    }
        
    func showAlert(type: String) {
        print("Weight is not a number")
        let alert = UIAlertController(title: "That's not a number...", message: "Please re-enter the weight you want to lift as a numeric value", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        //This last line goes in the call in WSVC
        //self.present(alert, animated: true)
    }
    
}