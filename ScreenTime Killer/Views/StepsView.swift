//
//  StepsScreen.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 23/08/2024.
//

import SwiftUI
import PhosphorSwift


struct StepsView: View {
    @EnvironmentObject var session: SessionManager

    var body: some View {
        Ph.info.regular
            .frame(width: 150, height: 150)
        Text("It's pretty Simple")
            .font(.largeTitle)
        Spacer()
                .frame(height: 50)
        VStack(alignment: .leading) {
            Text("1. Set screen time goal")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
                    .frame(height: 50)
            Text("2. Set price to pay if you don't reach the goal").font(.title2)
                .fontWeight(.bold)
            Spacer()
                    .frame(height: 50)
            Text("3. Stick to your goal! or pay the price...").font(.title2)
                .fontWeight(.bold)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        Spacer()
        Button("Set goal", systemImage: "arrow-right-light") {
            withAnimation{
                session.NextStep()
            }
        }
        .buttonStyle(BorderedProminentButtonStyle()).controlSize(.large)
    }
}

#Preview {
    StepsView()
        .environmentObject(SessionManager())
}
