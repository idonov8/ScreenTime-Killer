#if canImport(DeviceActivity)
import Foundation
import DeviceActivity
import FamilyControls

public class ScreenTimeMonitor {
    public static let shared = ScreenTimeMonitor()

    public let activityName = DeviceActivityName("com.screentime-killer.ScreenTime")
    public let eventName = DeviceActivityEvent.Name("com.screentime-killer.UsageExceeded")
    
    private let center = DeviceActivityCenter()
    
    private init() {}
    
    public func startMonitoring(usageGoalDuration: TimeInterval) {
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true
        )
        
        let selection = FamilyActivitySelection.init()  // Monitor all apps
        
        let event = DeviceActivityEvent(
//            applications: selection.applicationTokens,
//            categories: selection.categoryTokens,
            threshold: DateComponents(second: Int(usageGoalDuration))
        )
        
        do {
            try center.startMonitoring(activityName, during: schedule, events: [eventName: event])
        } catch {
            print("Failed to start monitoring: \(error)")
        }
    }
    
    public func stopMonitoring() {
        center.stopMonitoring()
    }
}

#else
// Provide a dummy implementation for non-iOS platforms
public class ScreenTimeMonitor {
    public static let shared = ScreenTimeMonitor()
    
    private init() {}
    
    public func startMonitoring(usageGoalDuration: TimeInterval) {
        print("ScreenTimeMonitor is only available on iOS")
    }
    
    public func stopMonitoring() {
        print("ScreenTimeMonitor is only available on iOS")
    }
}
#endif
