//
//  PlateMathCalculator.swift
//  BarbellMath
//
//  Created by Emily Corso on 1/4/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import UIKit

struct PlateMathCalculator {
    
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
    mutating func doPlateMathInLbs(totalWeight: Double, barWeight: Int) -> LbPlateQuantities {
        let lbPlateChoices = Plate().lbPlateChoices
        
        var weightToBeLoaded = totalWeight - Double(barWeight)
        var platesNeededToLoadBar = [Double]()
        
        for plate in lbPlateChoices {
            let platesLoaded = findPlateQuantity(weight: weightToBeLoaded, plateSize: plate)
            if let smallestPlateChoice = lbPlateChoices.last {
                if weightToBeLoaded >= (smallestPlateChoice * 2) {
                    platesNeededToLoadBar.append(platesLoaded)
                    weightToBeLoaded = calculateRemainingWeight(weight: weightToBeLoaded, plateSize: plate)
                } else {
                    platesNeededToLoadBar.append(0.0)
                }
            } else {
                assertionFailure("Failed to unwrap plateChocies.last.")
            }
        }
        return LbPlateQuantities(quantity45LbPlates: platesNeededToLoadBar[0],
                                 quantity25LbPlates: platesNeededToLoadBar[1],
                                 quantity10LbPlates: platesNeededToLoadBar[2],
                                 quantity5LbPlates: platesNeededToLoadBar[3],
                                 quantity2_5LbPlates: platesNeededToLoadBar[4])
    }
    
    mutating func doPlateMathInKgs(totalWeight: Double, barWeight: Int) -> KgPlateQuantities {
        let kgPlateChoices = Plate().kgPlateChoices
        
        var weightToBeLoaded = totalWeight - Double(barWeight)
        var platesNeededToLoadBar = [Double]()
        
        for plate in kgPlateChoices {
            let platesLoaded = findPlateQuantity(weight: weightToBeLoaded, plateSize: plate)
            if let smallestPlateChoice = kgPlateChoices.last {
                if weightToBeLoaded >= (smallestPlateChoice * 2) {
                    platesNeededToLoadBar.append(platesLoaded)
                    weightToBeLoaded = calculateRemainingWeight(weight: weightToBeLoaded, plateSize: plate)
                } else {
                    platesNeededToLoadBar.append(0.0)
                }
            } else {
                assertionFailure("Failed to unwrap plateChocies.last.")
            }
        }
        return KgPlateQuantities(quantity20KgPlates: platesNeededToLoadBar[0], quantity15KgPlates: platesNeededToLoadBar[1], quantity10KgPlates: platesNeededToLoadBar[2], quantity5KgPlates: platesNeededToLoadBar[3], quantity2_5KgPlates: platesNeededToLoadBar[4], quantity1_25KgPlates: platesNeededToLoadBar[5])
    }
}
