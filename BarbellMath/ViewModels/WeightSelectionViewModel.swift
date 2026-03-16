//
//  WeightSelectionViewModel.swift
//  BarbellMath
//
//  Created by Emily Corso on 3/16/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//
import SwiftUI

class WeightSelectionViewModel: ObservableObject {
    @Published var selectedUnit: Units = .lbs {
        didSet {
            selectedBarWeight = barSizes.first!.rawValue
        }
    }
    
    @Published var selectedBarWeight: Int = BarSizeInLbs.fourtyFive.rawValue
    
    // TODO: Add validations for text field and store this as a Double
    @Published var totalWeight: String = ""
    
    var allSearches: [SearchData]?
    
    var startingQuestion: String = "How much weight do you want to lift?"

    var unitText: String = "Units"
 
 
    var totalWeightText: String = "Total Weight"
    var totalWeightPrompt: String = "Weight"
        
    var barSizeText: String = "Bar Size"
    
    var barSizes: [any BarSize] {
        switch selectedUnit {
        case .lbs:
            Array(BarSizeInLbs.allCases)
        case .kgs:
            Array(BarSizeInKilos.allCases)
        }
    }

    // TODO: Migarte the button behavior next
    func submitUserSelections() {
//        let viewController = PlateCountViewController()
//        let validator = Validator()
//        var searchData = SearchData()
//        
//        guard let userEntry = weightTextField.text else {
//            let weightMustNotNBeEmptyAlert = validator.showAlert(message: "Weight field must not be empty.")
//            self.present(weightMustNotNBeEmptyAlert, animated: true)
//            return
//        }
//        
//        guard validator.isWholeNumber(userEntry: userEntry) else {
//            let mustBeAnIntAlert = validator.showAlert(message: "Weight must be entered as an integer value.")
//            self.present(mustBeAnIntAlert, animated: true)
//            return
//        }
//        
//        guard validator.isMultipleOf5(userEntry: userEntry) else {
//            let mustBeMultpleOf5Alert = validator.showAlert(message: "Weight must be a multiple of 5.")
//            self.present(mustBeMultpleOf5Alert, animated: true)
//            return
//        }
//        
//        guard validator.isAtLeast50lbs(userEntry: userEntry) else {
//            if unitsSetTo() == "lbs" {
//                let mustLiftMoreWeightAlert = validator.showAlert(message: "Weight must be at least 50lbs.")
//                self.present(mustLiftMoreWeightAlert, animated: true)
//            } else if unitsSetTo() == "kgs" {
//                let mustLiftMoreWeightAlert = validator.showAlert(message: "Weight must be at least 110kgs.")
//                self.present(mustLiftMoreWeightAlert, animated: true)
//            }
//            return
//        }
//            
//        searchData.barWeight = barSetTo()
//        searchData.units = unitsSetTo()
//        searchData.weight = Double(userEntry)
//        
//        if allSearches != nil {
//            self.allSearches!.insert(searchData, at: 0)
//        } else {
//            allSearches = [searchData]
//        }
//        
//        if let allSearches = allSearches {
//            do {
//                try DataStorage().save(searchData: allSearches)
//            } catch {
//                print("Save failed in WSVC submit")
//            }
//        }
//        
//        viewController.searchData = searchData
//        navigationController?.pushViewController(viewController, animated: true)
    }
}
