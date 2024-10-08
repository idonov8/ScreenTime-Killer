//
//  TimeLeftTodayReport.swift
//  DeviceActivityReportExtention
//
//  Created by Ido Nov on 02/09/2024.
//

import DeviceActivity
import SwiftUI
import Foundation

func readUsageGoalDuration() -> TimeInterval? {
    // Step 1: Get the URL for the shared app group directory
    if let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.screen-time-goal") {
        // Step 2: Append the file name to the directory path
        let fileURL = groupURL.appendingPathComponent("usageGoalData.plist")
        
        // Step 3: Read the file and decode the data
        do {
            let data = try Data(contentsOf: fileURL)
            let savedData = try PropertyListDecoder().decode([String: TimeInterval].self, from: data)
            
            // Step 4: Retrieve and return the value
            return savedData["usageGoalDuration"]
        } catch {
            print("Failed to read usageGoalDuration: \(error)")
        }
    }
    return nil
}

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let timeLeftToday = Self("Time Left Today")
}

struct timeLeftConfiguration {
    let totalRemainingActivity: Int
    let percentageUsed: Double
}

struct TimeLeftTodayReport: DeviceActivityReportScene {
    var context: DeviceActivityReport.Context {
        .timeLeftToday
    }

    var content: (timeLeftConfiguration) -> TimeLeftView

    let userSetGoal: TimeInterval
    
    init(userSetGoal: TimeInterval, content: @escaping (timeLeftConfiguration) -> TimeLeftView) {
        self.userSetGoal = userSetGoal
        self.content = content
    }

    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> timeLeftConfiguration {
        let totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })

        // Reading the usage goal duration
        if let retrievedUsageGoalDuration = readUsageGoalDuration() {
            print("Retrieved usage goal duration: \(retrievedUsageGoalDuration) seconds")
            return timeLeftConfiguration(totalRemainingActivity: Int((retrievedUsageGoalDuration - totalActivityDuration)) / 60, percentageUsed: totalActivityDuration / retrievedUsageGoalDuration)
        } else {
            print("Failed to retrieve usage goal duration.")
            // Handle error
            return timeLeftConfiguration(totalRemainingActivity: 0, percentageUsed: 0)
        }
    }
}
