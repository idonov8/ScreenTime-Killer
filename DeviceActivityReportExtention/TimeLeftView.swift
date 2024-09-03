//
//  TimeLeftView.swift
//  DeviceActivityReportExtention
//
//  Created by Ido Nov on 02/09/2024.
//

import SwiftUI

struct TimeLeftView: View {
    let totalRemainingActivity: String
//    let userSetGoal: TimeInterval

    var body: some View {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute, .second]
////        formatter.unitsStyle = .abbreviated
//
//        let totalActivityTime = TimeInterval(Double(totalRemainingActivity) ?? 6.5*3600)
//        let remainingTime = userSetGoal - totalActivityTime

        Text(totalRemainingActivity)
    }
}

// In order to support previews for your extension's custom views, make sure its source files are
// members of your app's Xcode target as well as members of your extension's target. You can use
// Xcode's File Inspector to modify a file's Target Membership.
#Preview {
    TimeLeftView(totalRemainingActivity: "1h 23m")
}
