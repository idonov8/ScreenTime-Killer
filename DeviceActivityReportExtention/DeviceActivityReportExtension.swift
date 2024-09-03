//
//  DeviceActivityReportExtention.swift
//  DeviceActivityReportExtention
//
//  Created by Ido Nov on 30/08/2024.
//

import DeviceActivity
import SwiftUI

@main
struct DeviceActivityReportExtention: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        @State var userSetGoal: TimeInterval = 1.5 * 3600

        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        
        TimeLeftTodayReport(userSetGoal: userSetGoal) { activity in
            TimeLeftView(totalRemainingActivity: activity)
        }
        // Add more reports here...
    }
}
