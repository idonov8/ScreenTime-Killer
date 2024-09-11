//
//  DeviceActivityMonitorExtension.swift
//  MyDeviceActivityMonitorExtension
//
//  Created by Ido Nov on 08/09/2024.
//

import DeviceActivity
import SharedScreenTime
import SwiftUI

func saveFailedDailyChallenge() {
    guard let userDefaults = UserDefaults(suiteName: "group.screen-time-goal") else {
        // Handle the case where UserDefaults could not be created
        print("Error: Could not access UserDefaults suite 'group.screen-time-goal'")
        return
    }
    
    userDefaults.set(true, forKey: "failedDailyChallenge")
    
    // Optional: Verify the save operation
    if userDefaults.bool(forKey: "failedDailyChallenge") != true {
        // Handle the case where the value was not saved correctly
        print("Error: Failed to save 'failedDailyChallenge' flag")
    } else {
        print("'failedDailyChallenge' flag saved successfully")
    }
}


// Optionally override any of the functions below.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.
class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        // Handle the start of the interval.
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        // Handle the end of the interval.
    }
    
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventDidReachThreshold(event, activity: activity)
        
        if event == ScreenTimeMonitor.shared.eventName && activity == ScreenTimeMonitor.shared.activityName {
            saveFailedDailyChallenge()
        }
    }
    
    override func intervalWillStartWarning(for activity: DeviceActivityName) {
        super.intervalWillStartWarning(for: activity)
        // Handle the warning before the interval starts.
    }
    
    override func intervalWillEndWarning(for activity: DeviceActivityName) {
        super.intervalWillEndWarning(for: activity)
        // Handle the warning before the interval ends.
    }
    
    override func eventWillReachThresholdWarning(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventWillReachThresholdWarning(event, activity: activity)
        
        // Handle the warning before the event reaches its threshold.
    }
}
