//
//  BarSize.swift
//  BarbellMath
//
//  Created by Emily Corso on 6/11/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

enum BarSize: CaseIterable, Codable, Hashable {
    case thirtyFiveLbs   // 35
    case fourtyFiveLbs   // 45
    case fifteenKg       // 15
    case twentyKg        // 20
    
    var weightValue: Double {
        switch self {
        case .thirtyFiveLbs: 35
        case .fourtyFiveLbs: 45
        case .fifteenKg:     15
        case .twentyKg:      20
        }
    }
    
    var units: Units {
        switch self {
        case .thirtyFiveLbs, .fourtyFiveLbs: .lbs
        case .fifteenKg, .twentyKg:          .kgs
        }
    }
    
    static func choices(for units: Units) -> [BarSize] {
        allCases.filter { $0.units == units }
    }
    
    // Let's move this display logic out of the model
    // Could also construct this from weight + units to make it more flexible
    var displayString: String {
        switch self {
        case .thirtyFiveLbs:
            return "35lb"
        case .fourtyFiveLbs:
            return "45lb"
        case .twentyKg:
            return "20kg"
        case .fifteenKg:
            return "15kg"
        }
    }
}
