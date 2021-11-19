//
//  SearchResult.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/18/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    var totalWeight: Double?
    var barLoadInLbs: BarLoadInLbs?
    var barLoadInKgs: BarLoadInKgs?
    var quantityOfCats: Int?
}
