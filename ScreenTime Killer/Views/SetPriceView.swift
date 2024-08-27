//
//  SetPriceView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 26/08/2024.
//

import SwiftUI

struct SetPriceView: View {
    @EnvironmentObject var session: SessionManager

    @State private var price = 50.0
    @State private var isEditing = false

    var body: some View {
        Spacer().frame(height:80)
        Text("Set your price 💸")
            .font(.title)
        Text("Choose a sum of money will make you stick to your goal")
            .font(.title2)
            .multilineTextAlignment(.center)
            .fontWeight(.light)
        VStack {
               Slider(
                   value: $price,
                   in: 1...1000,
                   step: 1
               ) {
                   Text("$")
               }  minimumValueLabel: {
                   Text("1")
               } maximumValueLabel: {
                   Text("1000")
               } onEditingChanged: { editing in
                   isEditing = editing
               }
            Text("\(price)$")
                   .foregroundColor(isEditing ? .red : .blue)
           }
        Spacer()
        Button("Set your price") {
            withAnimation {
                session.NextStep()
            }
        }
        .buttonStyle(BorderedProminentButtonStyle())
        .accentColor(.black)
        .controlSize(.large)
    }
}

#Preview {
    SetPriceView()
        .environmentObject(SessionManager())
}
