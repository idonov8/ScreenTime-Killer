//
//  SetPriceView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 25/08/2024.
//

import SwiftUI

struct SetGoalView: View {
    @EnvironmentObject var session: SessionManager

    // Initialize with default values
    @State var hours: Int = 2
    @State var minutes: Int = 30
    @State var days: Int = 30
    var body: some View {
        NavigationStack {
            VStack {
                Text("Set your goal ⛳")
                    .font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer().frame(height: 20)
                Text("What’s your desired max daily screen time?")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)

                TimePicker(hour: $hours, minutes: $minutes)
                    .padding(15)
                    .background(.white, in: .rect(cornerRadius: 10))
                    .padding(.horizontal, 20)
                Spacer().frame(height: 20)
                HStack(alignment: .firstTextBaseline) {
                    Text("I will stick to this goal for")
                    Picker("", selection: $days) {
                        ForEach(2..<100) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    Text("days")
                }
                HStack {
                    Text("\(Image(systemName: "info.circle")) It takes 66 days to form a new habit")
                        .font(.caption)
                }
            
            }.padding()
        }
        Spacer()

        NextStepButton(nextStep: {
            let totalDuration = TimeInterval(hours * 3600 + minutes * 60)
            session.setUsageGoal(duration: totalDuration, days: days)
            session.NextStep()
        }, title: "Set your goal")
    }
}

#Preview {
    SetGoalView()
        .environmentObject(SessionManager())
}
