//
//  SearchData.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/18/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

// TODO: Refactor this as an adapter to create the SearchResult
struct SearchData: Codable {
    var weight: Double
    var units: Units
    var barWeight: Int
    var result: SearchResult?
    
    init(weight: Double, units: Units, barWeight: Int) {
        self.weight = weight
        self.units = units
        self.barWeight = barWeight
        self.result = getSearchResult()
    }
    
    private func getSearchResult() -> SearchResult? {
        var result = SearchResult() // TODO: Refactor to use dependency injection instead of doing it this way
        var plateMathCalculator = PlateMathCalculator()
        
            switch units {
            case .lbs:
                result.barLoadInLbs = plateMathCalculator.doPlateMathInLbs(totalWeight: weight, barWeight: barWeight)
            case .kgs:
                result.barLoadInKgs = plateMathCalculator.doPlateMathInKgs(totalWeight: weight, barWeight: barWeight)
            }
            
            result.quantityOfCats = plateMathCalculator.findThisWeightInCats(totalWeight: weight, units: units)
            result.totalWeight = weight
        
        return result
    }
}
