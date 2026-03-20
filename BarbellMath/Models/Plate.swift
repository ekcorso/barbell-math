//
//  Plate.swift
//  BarbellMath
//
//  Created by Emily Corso on 6/29/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

struct Plate {
    // TODO: remove this legacy implementation after migration
    let lbPlateChoices = [45.0, 25.0, 10.0, 5.0, 2.5]
    let kgPlateChoices = [20, 15, 10, 5, 2.5, 1.25]
    
    // New implementation -- might be able to move this to Units?
    static func choices(for units: Units) -> [Double] {
        switch units {
        case .kgs:
            [20, 15, 10, 5, 2.5, 1.25]
        case .lbs:
            [45.0, 25.0, 10.0, 5.0, 2.5]
        }
    }
}
