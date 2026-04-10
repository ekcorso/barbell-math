//
//  PreviousSearchViewModel.swift
//  BarbellMath
//
//  Created by Emily Corso on 4/8/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//
import SwiftUI

class PreviousSearchViewModel: ObservableObject {
    @Published var previousSearches = [SearchData]()

    func load() {
        previousSearches = DataStorage().retrieve() ?? []
    }

    func delete(at offsets: IndexSet) {
        previousSearches.remove(atOffsets: offsets)
        try? DataStorage().save(searchData: previousSearches)
    }
}
