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
            Spacer()
            Text("\(daysLeft) days left")
                .font(.subheadline)
                .foregroundColor(daysLeft > 0 ? .primary : .red)
        }
        .padding()
    }
}

#Preview {
    ActiveChallengeView(daysLeft: 5).environmentObject(SessionManager())
}
