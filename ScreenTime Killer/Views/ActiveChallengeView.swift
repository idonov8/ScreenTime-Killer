//
//  ActiveChallengeView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 06/09/2024.
//

import SwiftUI

struct ActiveChallengeView: View {
    @EnvironmentObject var session: SessionManager
    let daysLeft: Int

    var body: some View {
        VStack {
            RemainingScreenTimeView().frame(height: 250)

            VStack {
                Text("Pledged price:")
                    .font(.system(size: 18))
                Text("\(session.riskAmount)$").font(.system(size: 70)).bold()
            }
            HStack {
               
                Link("\(Image(systemName: "info.circle")) How to reduce my screen time?", destination: URL(string: "https://ivory-kookaburra-2de.notion.site/How-to-reduce-my-screen-time-a31d7cf405bd406e937bf51b7362a214?pvs=4")!)
            }
            Spacer()
            DaysProgressBar(duration: session.usageGoalDays, startDay: session.goalSetDate, failedDays: [])
        }
        .padding()
    }
}

#Preview {
    ActiveChallengeView(daysLeft: 5).environmentObject(SessionManager())
}
