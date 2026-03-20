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
    var barWeight: BarSize
    var result: SearchResult?
    
    init(weight: Double, units: Units, barWeight: BarSize) {
        self.weight = weight
        self.units = units
        self.barWeight = barWeight
        self.result = getSearchResult()
    }
    
    private func getSearchResult() -> SearchResult? {
        var result = SearchResult() // TODO: Refactor to use dependency injection instead of doing it this way
            
        result.barLoad = PlateMathCalculator().calculate(weight: weight, barSize: barWeight, units: units)
        result.totalWeight = weight
        
        return result
    }
}
