//
//  ContentView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI
import DeviceActivity
import SharedScreenTime

struct ContentView: View {
    @EnvironmentObject var session: SessionManager

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
        
        if daysLeft == 0 {
            SuccessView(
                hoursGained: 40,// TODO: calculate an actual number
                daysChallenge: session.usageGoalDays,
                moneySaved: session.riskAmount,
                projectedDaysIn10Years: 200 //TODO: calculate actual number
                )
        } else if session.hasFailedDailyChallenge {
            Text("You failed!!!").onAppear {
                // TODO: Charge money
            }
            Text("Pledged price:")
            Text("\(session.riskAmount)$ has been charged from your credit card")
                .font(.subheadline)
            NextStepButton(nextStep: session.initStep, title: "Start a new challange")
        } else {
            ActiveChallengeView(daysLeft: daysLeft).environmentObject(session)
                .onAppear {
                    // Initialize ScreenTimeMonitor
//                    ScreenTimeMonitor.shared.startMonitoring(usageGoalDuration: session.usageGoalDuration)
                    ScreenTimeMonitor.shared.startMonitoring(usageGoalDuration: 30)//for debug
                }
        }
   }

}


#Preview {
    ContentView()
        .environmentObject(SessionManager())
}
