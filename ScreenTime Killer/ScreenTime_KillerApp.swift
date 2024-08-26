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
            MainAppView()
        }
    }
}
