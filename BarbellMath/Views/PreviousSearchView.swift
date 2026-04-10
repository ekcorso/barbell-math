//
//  PreviousSearchView.swift
//  BarbellMath
//
//  Created by Emily Corso on 4/8/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//
import SwiftUI

struct PreviousSearchView: View {
    @StateObject private var viewModel = PreviousSearchViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.previousSearches.indices, id: \.self) { index in
                    let item = viewModel.previousSearches[index]
                    NavigationLink(destination: PlateCountView(plateCountViewModel: PlateCountViewModel(searchData: item))) {
                        VStack(alignment: .leading) {
                            Text("\(Int(item.weight))\(item.units)")
                                .fontWeight(.semibold)
                            Text("\(item.barWeight.displayString) bar")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: viewModel.delete)
            }
            .navigationTitle("History")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.load()
            }
        }
    }
}
