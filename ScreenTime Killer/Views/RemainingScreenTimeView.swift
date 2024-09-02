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
    @State private var avgContext: DeviceActivityReport.Context = .init(rawValue: "Avarage Daily Activity")
    let center = AuthorizationCenter.shared // ask for permissions again maybe to make sure?
    let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: .now)!

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
        
        Text("Daily avarage:")
        DeviceActivityReport(avgContext, filter: DeviceActivityFilter(
            segment: .daily(
                during: DateInterval(start: sevenDaysAgo, end: .now)
                    )))
    }
}

#Preview {
    RemainingScreenTimeView()
}
