//
//  ContentView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI


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
        
        Image("zombie-phone")
            .resizable()
            .offset(x: -11)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle()).overlay {
                Circle().stroke(.white, lineWidth: 4)
            }.scaleEffect(CGSize(width: 0.5, height: 0.5))
            .padding(.bottom, -140)
            .offset(y: -80)
       Text("I'm watching you...")
        VStack(alignment: .leading, spacing: 20) {
                   
                   VStack(alignment: .leading) {
                       RemainingScreenTimeView().environmentObject(session).scaledToFit()
                       Text("Days left to reach the goal:")
                           .font(.headline)
                       Text("\(daysLeft) days")
                           .font(.subheadline)
                           .foregroundColor(daysLeft > 0 ? .primary : .red)
                   }
            
                    VStack(alignment: .leading) {
                        Text("Pledged price:")
                            .font(.headline)
                        Text("$\(session.riskAmount, specifier: "%.2f")")
                            .font(.subheadline)
                    }
            
                    
                   
                   if daysLeft == 0 {
                       Text("Goal period completed!")
                           .font(.headline)
                           .foregroundColor(.green)
                   }
                   
                   Spacer()
               }
               .padding()
           }
//        DeviceActivityReport.init(context)
    }


#Preview {
    ContentView()
        .environmentObject(SessionManager())
}
