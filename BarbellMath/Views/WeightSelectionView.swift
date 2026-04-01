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
    let horizontalPadding = 20.0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.startingQuestion)
                    .foregroundStyle(.primary)
                
                VStack {
                    totalWeightField
                    unitsPicker
                    barPicker
                    submitButton
                }
                .foregroundStyle(.primary)
                .padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40))
            }
            .navigationTitle("Barbell Math")
            .toolbarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $viewModel.navigateToPlateCount) {
                if let plateCountViewModel = viewModel.plateCountViewModel {
                    PlateCountView(plateCountViewModel: plateCountViewModel)
                }
            }
            .sheet(item: $viewModel.validationError) { error in
                ValidationAlertView(alertMessage: viewModel.alertMessageFor(error))
                    .presentationDetents([.medium])
                    .presentationBackground(Color(.secondarySystemBackground))
            }
        }
    }
    
    private var barPicker: some View {
        HStack {
            Text(viewModel.barSizeText)
            Picker("", selection: $viewModel.selectedBarWeight) {
                ForEach(viewModel.barSizes, id: \.self) { size in
                    Text("\(size.displayString)")
                        .tag(size)
                }
            }
            .pickerStyle(.segmented)
            .tint(.primary)
        }
    }
    
    private var unitsPicker: some View {
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
    }
    
    private var totalWeightField: some View {
        HStack {
            Text(viewModel.totalWeightText)
                .foregroundStyle(.black)
            TextField(viewModel.totalWeightPrompt, text: $viewModel.totalWeight)
                .textFieldStyle(.roundedBorder)
                .tint(.primary)
        }
    }
    
    private var submitButton: some View {
        Button("Show me how to load it") {
            viewModel.submitUserSelections()
        }
        .disabled(viewModel.totalWeight.isEmpty)
        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
        .background(viewModel.totalWeight.isEmpty ? .gray : .blue)
        .foregroundStyle(.white)
        .clipShape(Capsule())
    }
}

