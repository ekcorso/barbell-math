//
//  WeightSelectionView.swift
//  BarbellMath
//
//  Created by Emily Corso on 3/16/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//

import SwiftUI

struct WeightSelectionView: View {
    @StateObject private var viewModel = WeightSelectionViewModel()

    
    var body: some View {
        VStack {
            Text(viewModel.startingQuestion)
                .foregroundStyle(.primary)
            
            VStack {
                HStack {
                    Text(viewModel.totalWeightText)
                        .foregroundStyle(.black)
                    TextField(viewModel.totalWeightPrompt, text: $viewModel.totalWeight)
                        .textFieldStyle(.roundedBorder)
                        .tint(.primary)
                }
                
                HStack {
                    Text(viewModel.unitText)
                    Picker("", selection: $viewModel.selectedUnit) {
                        ForEach(Units.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .tint(.primary)
                }
                
                HStack {
                    Text(viewModel.barSizeText)
                    Picker("", selection: $viewModel.selectedBarWeight) {
                        ForEach(viewModel.barSizes.indices, id: \.self) { index in
                            let size = viewModel.barSizes[index]
                            Text(size.displayString)
                                .tag(size.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .tint(.primary)
                }
                
                Button("Show me how to load it") {
                    viewModel.submitUserSelections()
                }
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(Capsule())
            }
            .foregroundStyle(.primary)
            .padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40))
        }
    }
}

