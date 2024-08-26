//
//  MainAppView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 25/08/2024.
//

import SwiftUI

struct MainAppView: View {
    @StateObject private var session = SessionManager()

    var body: some View {
        VStack {
            if session.currentStep != .Step1 {
                // TODO: use "Navigation Link" so it looks nicer
                Button("Back") {
                    withAnimation{
                        session.initStep()
                    }
                }
                .offset(x: -130, y: -10)
            }
            switch session.currentStep {
            case .Step1:
                WelcomeView()
                    .environmentObject(session)
                    .transition(.move(edge: .leading))
            case .Step2:
                StepsView()
                    .environmentObject(session)
                    .transition(.move(edge: .leading ))
            case .Step3:
                ContentView()
//                SetPriceView()
//                    .environmentObject(session)
//                    .transition(.move(edge: .leading))
            default:
                // TODO: implement last screen
                ContentView()
                    .environmentObject(session)
                    .onAppear {
                        session.initStep()
                    }
            }
        }
    }
}

#Preview {
    MainAppView()
}
