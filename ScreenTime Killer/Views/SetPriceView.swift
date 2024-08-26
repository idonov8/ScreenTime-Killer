//
//  SetPriceView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 25/08/2024.
//

import SwiftUI

struct SetPriceView: View {
    @EnvironmentObject var session: SessionManager
    @State var notifyMeAbout:
    var body: some View {
        VStack {
            Text("Set your goal ⛳")
                .font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer().frame(height: 20)
            Text("What’s your desired max daily screen time?")
                .font(.title2)
                .multilineTextAlignment(.center)
                .fontWeight(.light)
        }.padding().offset(y: 100)

        Form {
            Section(header: Text("Notifications")) {
                Picker("Notify Me About", selection: $notifyMeAbout) {
                    Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                    Text("Mentions").tag(NotifyMeAboutType.mentions)
                    Text("Anything").tag(NotifyMeAboutType.anything)
                }
                Toggle("Play notification sounds", isOn: $playNotificationSounds)
            }
            }
        }
        
        Spacer()

        Button("Set your price") {
            withAnimation {
//                session.NextStep()
            }
        }.buttonStyle(BorderedProminentButtonStyle()).controlSize(.large)
    }
}

#Preview {
    SetPriceView()
        .environmentObject(SessionManager())
}
