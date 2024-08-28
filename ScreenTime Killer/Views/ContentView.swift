//
//  ContentView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI
import _DeviceActivity_SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionManager
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
          segment: .daily(
              during: Calendar.current.dateInterval(
                 of: .weekOfYear, for: .now
              )!
          ),
          users: .children,
          devices: .init([.iPhone, .iPad])
      )
    
    var body: some View {
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
        DeviceActivityReport.init(context)
    }
}

#Preview {
    ContentView()
        .environmentObject(SessionManager())
}
