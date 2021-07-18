//
//  Validator.swift
//  BarbellMath
//
//  Created by Emily Corso on 7/17/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

class Validator {
    func isWholeNumber(userEntry: String) -> Bool {
        if let _ = Int(userEntry) {
            return true
        } else {
            return false
        }
    }
    
    func isMultipleOf5(userEntry: String) -> Bool {
        if Int(userEntry)! % 5 == 0 {
            return true
        } else {
            return false
        }
    }
    
    func isAtLeast50lbs(userEntry: String) -> Bool {
        if Int(userEntry)! >= 50 {
            return true
        } else {
            return false
        }
    }
        
    func showAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Let's keep the warm-up going...", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        return alert
    }
    
}
