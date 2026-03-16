//
//  BarSize.swift
//  BarbellMath
//
//  Created by Emily Corso on 6/11/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

protocol BarSize: RawRepresentable, CaseIterable where RawValue == Int {
    var displayString: String { get }
}

enum BarSizeInLbs: Int, BarSize {
    case thirtyFive = 35
    case fourtyFive = 45
    
    var displayString: String {
        switch self {
        case .thirtyFive:
            "35lb"
        case .fourtyFive:
            "45lb"
        }
    }
}

enum BarSizeInKilos: Int, BarSize {
    case fifteen = 15
    case twenty = 20
    
    var displayString: String {
        switch self {
        case .twenty:
            return "20kg"
        case .fifteen:
            return "15kg"
        }
    }
}
