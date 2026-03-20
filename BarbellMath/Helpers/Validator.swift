//
//  Validator.swift
//  BarbellMath
//
//  Created by Emily Corso on 7/17/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit // TODO: (Remove this too, Validator should not know about UI code)

// TODO: Remove this and promote the extension to main declaration when the migration is complete
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

// New -- should only need this part after the migration
enum TotalValidationError: Error, Identifiable {
    var id: Self { self }
    
    case notInteger
    case notDivisibleByFive
    case belowMinimumWeight
}

extension Validator {
    // TODO: Update this logic for the following:
    // kg users can enter multiples of .5, not just Ints that are multiples of 5
    // min weight should depend on bar and units
    func isValid(total weight: Double) throws(TotalValidationError) {
        guard weight == weight.rounded() else { throw .notInteger }
        guard Int(weight) % 5 == 0     else { throw .notDivisibleByFive }
        guard weight >= 50             else { throw .belowMinimumWeight }
    }
}
