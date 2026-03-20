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
            if let firstAvailableSize = barSizes.first {
                selectedBarWeight = firstAvailableSize
            }
        }
    }
    
    @Published var selectedBarWeight: BarSize = BarSize.fourtyFiveLbs
    
    // TODO: Store this as a Double
    @Published var totalWeight: String = ""
    
    // MARK: Navigation Properties
    @Published var plateCountViewModel: PlateCountViewModel? = nil
    @Published var navigateToPlateCount = false
    
    // MARK: Properties
    var barSizes: [BarSize] { BarSize.choices(for: self.selectedUnit) }
    
    var allSearches: [SearchData]?
    
    var startingQuestion: String = "How much weight do you want to lift?"

    var unitText: String = "Units"
 
    var totalWeightText: String = "Total Weight"
    var totalWeightPrompt: String = "Weight"
        
    var barSizeText: String = "Bar Size"

    // MARK: Functions
    
    // TODO: Finish migrating the alert pattern. Refator to simplify this and migrate to SwiftUI.
    func submitUserSelections() {
        let validator = Validator()
        let doubleWeight = Double(totalWeight) ?? 225 // TODO: This is just a patch, finish migrating the totalWeight to be a num them remove this
        var searchData = SearchData(weight: doubleWeight, units: self.selectedUnit, barWeight: self.selectedBarWeight)
        
        guard !totalWeight.isEmpty  else {
            let weightMustNotNBeEmptyAlert = validator.showAlert(message: "Weight field must not be empty.")
//            self.present(weightMustNotNBeEmptyAlert, animated: true)
            return
        }
        
        guard validator.isWholeNumber(userEntry: totalWeight) else {
            let mustBeAnIntAlert = validator.showAlert(message: "Weight must be entered as an integer value.")
//            self.present(mustBeAnIntAlert, animated: true)
            return
        }
        
        guard validator.isMultipleOf5(userEntry: totalWeight) else {
            let mustBeMultpleOf5Alert = validator.showAlert(message: "Weight must be a multiple of 5.")
//            self.present(mustBeMultpleOf5Alert, animated: true)
            return
        }
        
        guard validator.isAtLeast50lbs(userEntry: totalWeight) else {
            switch selectedUnit {
            case .lbs:
                let mustLiftMoreWeightAlert = validator.showAlert(message: "Weight must be at least 50lbs.")
//                self.present(mustLiftMoreWeightAlert, animated: true)
            case .kgs:
                let mustLiftMoreWeightAlert = validator.showAlert(message: "Weight must be at least 110kgs.")
//                self.present(mustLiftMoreWeightAlert, animated: true)
            }
            
            return
        }
            
        searchData.barWeight = selectedBarWeight
        searchData.units = selectedUnit
        searchData.weight = doubleWeight // TODO: This is just a patch, finish migrating the totalWeight to be a num them remove this
        
        // TODO: Refactor this
        if allSearches != nil {
            self.allSearches!.insert(searchData, at: 0)
        } else {
            allSearches = [searchData]
        }
        
        if let allSearches = allSearches {
            do {
                try DataStorage().save(searchData: allSearches)
            } catch {
                print("Save failed in WSVC submit")
            }
        }
        
        self.plateCountViewModel = PlateCountViewModel(searchData: searchData)
        self.navigateToPlateCount = true
    }
}
