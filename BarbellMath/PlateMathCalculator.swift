//
//  PlateMathCalculator.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/4/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

struct PlateMathCalculator {
    
    var quantity45LbPlates: Int = 0
    var quantity25LbPlates: Int = 0
    var quantity10LbPlates: Int = 0
    var quantity5LbPlates: Int = 0
    var quantity2_5LbPlates: Int = 0
    
    //This func takes a starting weight and a plate size and returns the quantity of that plate than can be evenly (as both an Int and an even number) divided into the total. This slices off a quantity of each plate size that can be loaded in pairs.
    func findPlateQuantity(weight: Double, plateSize: Double) -> Double {
        var plateQuantity = 0.0
        
        let isEvenNumberOfPlates = Int(weight / plateSize) % 2 == 0
        
        if isEvenNumberOfPlates {
            plateQuantity = Double(Int(weight / plateSize))
        } else {
            plateQuantity = Double(Int(weight / plateSize)) - 1.0
        }
        
        return plateQuantity
    }
    
    //This func takes a starting weight and plate size and returns only the remaining weight after an even number of the given plate size has been sliced off the total.
    func calculateRemainingWeight(weight: Double, plateSize: Double) -> Double {
        var weightRemainder = 0.0
        
        let isEvenNumberOfPlates = Int(weight / plateSize) % 2 == 0
        
        if isEvenNumberOfPlates {
            weightRemainder = weight.truncatingRemainder(dividingBy: plateSize)
        } else {
            weightRemainder = weight.truncatingRemainder(dividingBy: plateSize) + plateSize
        }
        
        return weightRemainder
    }
    
    //Takes a given weight and returns an array containing the quantity of each plate necessary to load the bar.
    mutating func doPlateMath(totalWeight: Double) -> [Double] {
        let plateChoices = [45.0, 25.0, 10.0, 5.0, 2.5]
        let barbellWeight = 45.0
        var weightToBeLoaded = totalWeight - barbellWeight
        var platesNeededToLoadBar = [Double]()
        
        for plate in plateChoices {
            let platesLoaded = findPlateQuantity(weight: weightToBeLoaded, plateSize: plate)
            if weightToBeLoaded >= 5 {
                platesNeededToLoadBar.append(platesLoaded)
                weightToBeLoaded = calculateRemainingWeight(weight: weightToBeLoaded, plateSize: plate)
            }
        }
        return platesNeededToLoadBar
    }
}
