//
//  BarLoad.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/10/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

// TODO: Legacy Implementation, remove when migration is complete
struct BarLoadInLbs: Codable {
    var quantity45LbPlates: Double = 0
    var quantity25LbPlates: Double = 0
    var quantity10LbPlates: Double = 0
    var quantity5LbPlates: Double = 0
    var quantity2_5LbPlates: Double = 0
}

struct BarLoadInKgs: Codable {
    var quantity20KgPlates: Double = 0
    var quantity15KgPlates: Double = 0
    var quantity10KgPlates: Double = 0
    var quantity5KgPlates: Double = 0
    var quantity2_5KgPlates: Double = 0
    var quantity1_25KgPlates: Double = 0
}

// Replaces the legacy BarLoadInKgs and BarLoadInLbs types
struct BarLoad: Codable {
    let plateLoadPerSize: [PlateLoad]
    let quantityInCats: Int
}

struct PlateLoad: Codable {
    let plateSize: Double
    let quantity: Int // must be an even number
    let units: Units
    
    // Will need to move this to the PlateCountViewModel if there ends up being more display logic
    var formattedLoad: String {
        "(\(quantity)) \(plateSize.formatted())\(units) plates"
    }
}
