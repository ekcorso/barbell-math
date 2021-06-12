//
//  Plate.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/10/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

struct Plate {
    
    let lbPlateChoices = [45.0, 25.0, 10.0, 5.0, 2.5]
    let kgPlateChoices = [20, 15, 10, 5, 2.5, 1.25]
    
    func labelString() -> String {
        return ""
    }
    
    //Need array<Double> of increments for each kind of units
    //Need variables for the quantity of each plate size, also seperated by units
    //Do I need a enum of the individual units themselves? (This takes some work because they are doubles, so the enum raw values will always need to be converted to be used anyway. See BarSize and/or plateStructDraft).
    //Should this maybe also contain the plate quantity sting(s) that PCVC uses to display the final result?
}

//protocol PlateQuantity {
//
//}

struct PlateQuantities {
    var quantity45LbPlates: Double = 0
    var quantity25LbPlates: Double = 0
    var quantity10LbPlates: Double = 0
    var quantity5LbPlates: Double = 0
    var quantity2_5LbPlates: Double = 0
    
//    init(units: String) {
//        if units == Units.lb.rawValue {
//
//        }
//    }
    
}

struct kgPlateQuantities {
    var quantity20KgPlates: Double = 0
    var quantity15KgPlates: Double = 0
    var quantity10KgPlates: Double = 0
    var quantity5KgPlates: Double = 0
    var quantity2_5KgPlates: Double = 0
    var quantity1_25KgPlates: Double = 0
}
