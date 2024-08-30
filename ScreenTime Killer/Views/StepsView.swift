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

                
            Spacer()
                    .frame(height: 50)
            Text("2. Set price to pay if you don't reach the goal")
                
            Spacer()
                    .frame(height: 50)
            Text("3. Stick to your goal! or pay the price.")
                
        }
        .padding(.horizontal, 18)
//        .fontDesign(.rounded)
        .fontWeight(.light)
        .font(.system(size: 24))
        .fixedSize(horizontal: false, vertical: true)

        Spacer()
        
        NextStepButton(nextStep: session.NextStep, title: "Set goal")

    }
}

#Preview {
    StepsView()
        .environmentObject(SessionManager())
}
