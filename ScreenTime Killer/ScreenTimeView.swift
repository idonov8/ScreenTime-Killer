//
//  ScreenTimeView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 21/08/2024.
//

import SwiftUI
import DeviceActivity
import FamilyControls

func requestScreenTimePermission() {
    Task {
        let center = AuthorizationCenter.shared
        do {
            try await center.requestAuthorization(for: FamilyControlsMember.individual)
        } catch {
            // Handle the error here.
        }

    }
}


struct ScreenTimeView: View {
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
    segment: .daily(
        during: Calendar.current.dateInterval(
           of: .day, for: .now
        )!
    ),
    users: .all,
    devices: .init([.iPhone, .iPad])
    );
    var body: some View {
        Text("Screen time data:").onAppear{
            requestScreenTimePermission()
        }
        DeviceActivityReport(context, filter: filter)
    }
}

#Preview {
    ScreenTimeView()
}
