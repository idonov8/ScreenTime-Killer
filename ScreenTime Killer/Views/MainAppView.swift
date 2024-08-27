//
//  MainAppView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 25/08/2024.
//

import SwiftUI

struct MainAppView: View {
    @StateObject private var session = SessionManager()
    @State private var isBack = false

    let transition: AnyTransition = .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )

    let backTransition: AnyTransition = .slide
    

    var body: some View {
        VStack {
            if session.currentStep != .Step1 {
                // TODO: use "Navigation Link" so it looks nicer
                Button("Back") {
                    withAnimation {
                        isBack = true
                        session.PrevStep()
                        Task {
                            isBack = false
                        }
                        
                    }
                }
                .offset(x: -130, y: -10)
            }
            switch session.currentStep {
            case .Step1:
                WelcomeView()
                    .environmentObject(session)
                    .transition(isBack ? backTransition : transition)
            case .Step2:
                StepsView()
                    .environmentObject(session)
                    .transition(isBack ? backTransition : transition)
            case .Step3:
                SetGoalView()
                    .environmentObject(session)
                    .transition(isBack ? backTransition : transition)
            case .Step4:
                SetPriceView()
                    .environmentObject(session)
                    .transition(isBack ? backTransition : transition)
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
