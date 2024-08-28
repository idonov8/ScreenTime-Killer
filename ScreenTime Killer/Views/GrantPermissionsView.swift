//
//  GrantPermissionsView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 27/08/2024.
//

import SwiftUI

import DeviceActivity
import FamilyControls


func requestScreenTimePermission(center: AuthorizationCenter) {
    Task {
        try await center.requestAuthorization(for: .individual)
    }
}

struct GrantPermissionsView: View {
    @EnvironmentObject var session: SessionManager
    let center = AuthorizationCenter.shared
    @State private var didGetPermission: Bool = false

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
            if didGetPermission {
                Rectangle().hidden().onAppear {
                    session.NextStep()
                }
            } else {
                Button ("grant permissions") {
                    requestScreenTimePermission(center: center)

                    didGetPermission = center.authorizationStatus.rawValue == 2
                    
                }
                Spacer()
            }


//            DeviceActivityReport(context, filter: filter)

//            NextStepButton(nextStep: session.NextStep, title: "Grant permissions")

        }
    }
}

#Preview {
    GrantPermissionsView()
        .environmentObject(SessionManager())
}
