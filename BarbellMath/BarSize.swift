//
//  BarSize.swift
//  BarbellMath
//
//  Created by Emily Corso on 6/11/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

enum BarSizeInLbs: Int {
    case thirtyFive
    case fourtyFive
    
    func asInt() -> Int {
        switch self {
        case .thirtyFive:
            return 35
        case .fourtyFive:
            return 45
        }
    }
    
    func asString() -> String {
        switch self {
        case .thirtyFive:
            return "35lb"
        case .fourtyFive:
            return "45lb"
        }
    }
}

enum BarSizeInKilos: Int {
    case twenty
    case fifteen
    
    func asInt() -> Int {
        switch self {
        case .twenty:
            return 20
        case .fifteen:
            return 15
        }
    }
    
    func asString() -> String {
        switch self {
        case .twenty:
            return "20kg"
        case .fifteen:
            return "15kg"
        }
    }
    
}
