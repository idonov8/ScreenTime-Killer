//
//  GrantPermissionsView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 27/08/2024.
//

import SwiftUI

struct GrantPermissionsView: View {
    @EnvironmentObject var session: SessionManager

    var body: some View {
        VStack {
            Text("Almost done!")
                .font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer().frame(height: 20)
            Text("Please grant screen time access")
                .font(.title2)
                .multilineTextAlignment(.center)
                .fontWeight(.light)
            Spacer()

            NextStepButton(nextStep: session.NextStep, title: "Grant permissions")

        }
    }
}

#Preview {
    GrantPermissionsView()
}
