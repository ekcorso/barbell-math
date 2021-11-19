//
//  SearchData.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/18/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

struct SearchData {
    var weight: Double!
    var units: String!
    var barWeight: Int!
    var result: SearchResult {
        var result = SearchResult()
        var plateMathCalculator = PlateMathCalculator()

        if units == Units.lbs.rawValue {
            result.barLoadInLbs = plateMathCalculator.doPlateMathInLbs(totalWeight: weight, barWeight: barWeight)
        } else {
            result.barLoadInKgs = plateMathCalculator.doPlateMathInKgs(totalWeight: weight, barWeight: barWeight)
        }
        
        result.quantityOfCats = plateMathCalculator.findThisWeightInCats(totalWeight: weight)
        
        return result
    }
}
