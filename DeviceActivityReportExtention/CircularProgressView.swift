//
//  CircularProgressView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 05/09/2024.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let color: Color

    
    var body: some View {
        ZStack { // 1
                   Circle()
                       .stroke(
                           color.opacity(0.1),
                           lineWidth: 10
                       )
                   Circle() // 2
                        .trim(from: 0, to: 0.15) // 1
                       .stroke(
                           color,
                           style: StrokeStyle(
                                lineWidth: 10,
                                lineCap: .round
                               )
                       ).rotationEffect(.degrees(160))
               }
        }
}

#Preview {
    CircularProgressView(progress: 0.8, color: .orange)
}
