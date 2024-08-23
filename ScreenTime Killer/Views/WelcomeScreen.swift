//
//  WelcomeScreen.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 23/08/2024.
//

import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var session: SessionManager

    var body: some View {
        VStack {
            CircularLogo()
                .scaleEffect(CGSize(width: 0.5, height: 0.5))
                .padding(.bottom, -600)
                .offset(y: -330)
            Text("Screen Time Killer")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .lineLimit(0)
            Text("Screen Time Killer helps you reduce your phone usage by raising the stakes.")
                .font(.title3).multilineTextAlignment(.center).padding([.leading, .bottom, .trailing], 20.0).padding([.top], 1.0)
            
            Button("Get started, it's free!") {
                withAnimation{
                    session.NextStep()
                }
            }
            .buttonStyle(BorderedProminentButtonStyle()).controlSize(.large)
        }
    }
}

#Preview {
    WelcomeScreen()
        .environmentObject(SessionManager())
}

//struct WelcomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeScreen()
//                .environmentObject(SessionManager())
//    }
//}
