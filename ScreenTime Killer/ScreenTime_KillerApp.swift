//
//  ScreenTime_KillerApp.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI

@main
struct ScreenTime_KillerApp: App {
    @StateObject private var session = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            switch session.currentStep {
            case .Step1:
                WelcomeScreen()
                    .environmentObject(session)
                    .transition(.opacity)
            case .Step2:
                StepsScreen()
                    .environmentObject(session)
                    .transition(.opacity)
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
