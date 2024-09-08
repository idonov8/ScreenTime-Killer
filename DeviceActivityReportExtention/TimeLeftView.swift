//
//  TimeLeftView.swift
//  DeviceActivityReportExtention
//
//  Created by Ido Nov on 02/09/2024.
//

import SwiftUI

extension Double {
    func toPercentageString(withDecimals decimals: Int = 0) -> String {
        return String(format: "%.\(decimals)f%%", self * 100)
    }
}

struct TimeLeftView: View {
    let totalRemainingActivity: Int
    let percentageUsed: Double
    let percentageOfDayPassed: Double = {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        return now.timeIntervalSince(startOfDay) / 86400
    }()

    func getColor() -> Color {
        print(percentageOfDayPassed)
        let correctUsageIndicator = percentageUsed / percentageOfDayPassed
        let tolerance: Double = 0.3 // Define how close to 1 you consider "close enough"
        if abs(correctUsageIndicator - 1) <= tolerance {
            return .orange
        } else if correctUsageIndicator < 1 {
            return .green
        } else {
            return .red
        }
    }

    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: percentageUsed, color: getColor())
                    .frame(width: 100, height: 100)
                Text("\(totalRemainingActivity)").foregroundColor(getColor()).font(.largeTitle)
                    .bold()
            }
            Spacer().frame(height: 15)
            Text("Minutes left to use your phone today").bold()
            Text("You’ve used \(percentageUsed.toPercentageString()) of your screen time").font(.subheadline)
            
        }
    }
}

// In order to support previews for your extension's custom views, make sure its source files are
// members of your app's Xcode target as well as members of your extension's target. You can use
// Xcode's File Inspector to modify a file's Target Membership.
#Preview {
    TimeLeftView(totalRemainingActivity: 52, percentageUsed: 0.8)
}
