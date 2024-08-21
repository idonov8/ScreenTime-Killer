//
//  ScreenTimeMonitor.swift
//  ScreenTimeMonitor
//
//  Created by Ido Nov on 21/08/2024.
//

import DeviceActivity
import SwiftUI

@main
struct ScreenTimeMonitor: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
