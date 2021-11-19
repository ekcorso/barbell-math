//
//  Utilities.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/19/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // send back the first path, which should be the only one
        return paths[0]
    }
}
