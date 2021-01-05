//
//  Exercise.swift
//  BarbellMath
//
//  Created by Emily Corso on 12/27/20.
//  Copyright © 2020 Emily Corso. All rights reserved.
//

import UIKit

//This may need to ba class so that it can be exposed to objective c

struct Exercise {
    var name: String
    var day: String = "Day 1"
    // Day should be an enum so there are limited choices. Maybe represented with a segmented control in the UI? Should day be it's own struct so it can be formatted or am I overthinking it?
    //Mike suggests tryinig to create a day enum, then have the day variable be an array of day enums
    var sets: Int = 0
    var reps: Int = 0
}
