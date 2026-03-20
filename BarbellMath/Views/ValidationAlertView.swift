//
//  ValidationAlertView.swift
//  BarbellMath
//
//  Created by Emily Corso on 3/20/26.
//  Copyright © 2026 Emily Corso. All rights reserved.
//

import SwiftUI

struct ValidationAlertView: View {
    @Environment(\.dismiss) var dismiss
    
    var alertMessage: String = ""
    
    var body: some View {
        VStack(spacing: 30.0) {
            VStack(spacing: 22.0) {
                Text("Let's keep the warm-up going while we figure this out...")
                Image(systemName: "figure.cooldown.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.yellow)
                Text(alertMessage)
            }
            Button {
                dismiss()
            } label: {
                Text("Okay")
            }
            .frame(minWidth: 100.0)
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
        }
    }
}
