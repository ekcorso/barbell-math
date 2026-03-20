//
//  PlateCountView.swift
//  BarbellMath
//
//  Created by Emily Corso on 3/17/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//

import SwiftUI

struct PlateCountView: View {
    var plateCountViewModel: PlateCountViewModel
    
    var body: some View {
        VStack(spacing: 22.0) {
            Text(plateCountViewModel.explanationText)
            VStack(alignment: .leading, spacing: 8.0) {
                ForEach(plateCountViewModel.plateLoads, id: \.plateSize) { plateLoad in
                    Text(plateLoad.formattedLoad)
                }
            }
            Text(plateCountViewModel.catQuantityText)
        }
    }
}
