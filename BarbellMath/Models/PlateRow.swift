//
//  PlateRow.swift
//  BarbellMath
//
//  Created by Emily Corso on 3/18/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//


// Replaces the legacy BarLoadInKgs and BarLoadInLbs types
struct BarLoad {
    let plateLoadPerSize: [PlateRow]
}

struct PlateRow {
    let plateSize: Double
    let quantity: Int // must be an even number
    let units: Units
    
    var unitLabel: String {
        // "45lb" "20kg" etc
        "\(plateSize.formatted()) \(units))"
    }
}
