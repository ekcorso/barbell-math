//
//  PlateCountViewModel.swift
//  BarbellMath
//
//  Created by Emily Corso on 3/17/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//
import SwiftUI

class PlateCountViewModel {
    var explanationText: String
    var plateLoads: [PlateLoad]
    var catQuantityText: String = "Error: no kitty conversion available"
    
    init(searchData: SearchData) {
        // TODO: Add a helper for assembling this string to make it more readable
        self.explanationText = "Here's what you'll need to load \(Int(searchData.weight))\(searchData.units) with a \(Int(searchData.barWeight.weightValue))\(searchData.units) bar:"
        
        if let quantityOfCats = searchData.result?.barLoad?.quantityInCats {
            self.catQuantityText = "Pick this up and you'll be lifting the weight of \(quantityOfCats) cats!"
        }
        
        self.plateLoads = searchData.result?.barLoad?.plateLoadPerSize ?? [PlateLoad]()
    }
}
