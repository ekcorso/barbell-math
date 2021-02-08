//
//  Exercise.swift
//  BarbellMath
//
//  Created by Emily Corso on 12/27/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

class Exercise {
    
    init(name: String, sets: Int, reps: Int) {
        self.name = name
        self.sets = sets
        self.reps = reps
    }
    
    var name: String = ""
    var day: String = "Day 1"
    // Day should be an enum so there are limited choices. Maybe represented with a segmented control in the UI? Should day be it's own struct so it can be formatted or am I overthinking it?
    //Mike suggests trying to create a day enum, then have the day variable be an array of day enums
    var sets: Int = 0
    var reps: Int = 0
    var notes: String = "No notes yet"
}
