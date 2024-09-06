//
//  SetPriceView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 26/08/2024.
//

import SwiftUI

struct SetPriceView: View {
    @EnvironmentObject var session: SessionManager

    @State private var price: Int = 50
    @State private var isEditing = false

    var body: some View {
        let doublePrice = Binding(
                    get: { Double(self.price) },
                    set: { self.price = Int($0) } // Or other custom logic
                )
        VStack {
            Spacer().frame(height:80)
            Text("Set your price 💸")
                .font(.title)
            Text("Choose a sum of money will make you stick to your goal")
                .font(.title2)
                .multilineTextAlignment(.center)
                .fontWeight(.light)
               Slider(
                value: doublePrice,
                   in: 5...1000,
                   step: 5
               ) {
                   Text("$")
               }  minimumValueLabel: {
                   Text("5")
               } maximumValueLabel: {
                   Text("1000")
               } onEditingChanged: { editing in
                   isEditing = editing
               }
            Spacer().frame(height:60)
            Text("\(price)$")
                .foregroundColor(isEditing ? .blue : .black).bold().font(.largeTitle)
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
