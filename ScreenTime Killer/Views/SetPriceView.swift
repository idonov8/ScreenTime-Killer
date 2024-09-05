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
                   step: 10
               ) {
                   Text("$")
               }  minimumValueLabel: {
                   Text("1")
               } maximumValueLabel: {
                   Text("1000")
               } onEditingChanged: { editing in
                   isEditing = editing
               }
            let formattedPrice = String(format: "%.0f", price)
            Text("\(formattedPrice)$")
                   .foregroundColor(isEditing ? .red : .blue)
        }.padding()
        Spacer()

        NextStepButton(nextStep: {
            session.setRiskAmount(price)
            session.NextStep()
        }, title: "Set your price")

    }
}

#Preview {
    SetPriceView()
        .environmentObject(SessionManager())
}
