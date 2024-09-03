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
    @EnvironmentObject var session: SessionManager

    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var timeLeftContext: DeviceActivityReport.Context = .init(rawValue: "Time Left Today")
    let center = AuthorizationCenter.shared // ask for permissions again maybe to make sure?
    let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -1, to: .now)!

    var body: some View {
#if DEBUG
        let _ = Self._printChanges()
#endif
//        Text("Today the device had been used:")
//        DeviceActivityReport(context, filter: DeviceActivityFilter(
//            segment: .daily(
//                during: Calendar.current.dateInterval(
//                   of: .day, for: .now
//                )!)))
        
        Text("Time Left today:")

        let context = timeLeftContext
        let filter = DeviceActivityFilter(
            segment: .daily(during: DateInterval(start: Date(), end: .now))
        )
        DeviceActivityReport(context, filter: filter)
        
//        // Pass the report to DeviceActivityReport
//        DeviceActivityReport(timeLeftContext, filter: DeviceActivityFilter(
//            segment: .daily(during: DateInterval(start: sevenDaysAgo, end: .now))
//        ))

    }
}

#Preview {
    RemainingScreenTimeView()
}
