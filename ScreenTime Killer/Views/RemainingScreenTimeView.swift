//
//  RemainingScreenTimeView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 29/08/2024.
//

import SwiftUI
import DeviceActivity
import FamilyControls
//import DeviceActivityReportExtention

struct RemainingScreenTimeView: View {
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
        segment: .daily(
            during: Calendar.current.dateInterval(
               of: .day, for: .now
            )!
        ),
        users: .all,
        devices: .init([.iPhone, .iPad])
    )
    let center = AuthorizationCenter.shared

    var body: some View {
        Text("Device as been used:")
        DeviceActivityReport(context, filter:filter)
        
    }
}

#Preview {
    RemainingScreenTimeView()
}
