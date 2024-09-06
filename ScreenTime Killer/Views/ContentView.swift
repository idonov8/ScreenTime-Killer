//
//  ContentView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var session: SessionManager
    @State private var userFailedGoal: Bool = false // TODO: Populate using DeviceActivityMonitor
    
    var body: some View {
        var daysLeft: Int {
                let calendar = Calendar.current
                let goalEndDate = calendar.date(byAdding: .day, value: session.usageGoalDays, to: session.goalSetDate)!
                let now = Date()
                
                if now >= goalEndDate {
                    return 0
                } else {
                    let components = calendar.dateComponents([.day], from: now, to: goalEndDate)
                    return components.day ?? 0
                }
            }
        
        if daysLeft == -1 { // Should be 0
            Text("Goal period completed!")
                .font(.headline)
                .foregroundColor(.green)
        } else if userFailedGoal {
            Text("You failed!!!").onAppear {
                // TODO: Charge money
            }
            Text("Pledged price:")
            Text("\(session.riskAmount)$ has been charged from your credit card")
                .font(.subheadline)
            NextStepButton(nextStep: session.initStep, title: "Start a new challange")
        } else {
            ActiveChallengeView(daysLeft: daysLeft).environmentObject(session)
        }
   }

}


#Preview {
    ContentView()
        .environmentObject(SessionManager())
}
