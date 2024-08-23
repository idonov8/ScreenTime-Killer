//
//  ScreenTimeView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 21/08/2024.
//

import SwiftUI
import DeviceActivity
import FamilyControls

import ManagedSettings

class MyMonitorExtension: DeviceActivityMonitor {
    let store = ManagedSettingsStore()
    
    
    // You can use the `store` property to shield apps when an interval starts, ends, or meets a threshold.
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        print(store)
        
        
        // Shield selected applications.
//        let model = MyModel()
//        let applications = model.selectionToShield.applications
//        store.shield.applications = applications.isEmpty ? nil : applications
    }
}


func requestScreenTimePermission() {
    Task {
        let center = AuthorizationCenter.shared
        do {
            try await center.requestAuthorization(for: FamilyControlsMember.individual)
        } catch {
            // Handle the error here.
        }

    }
}


struct ScreenTimeView: View {
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
          segment: .daily(
              during: Calendar.current.dateInterval(
                 of: .weekOfYear, for: .now
              )!
          ),
          users: .children,
          devices: .init([.iPhone, .iPad])
      )
    var body: some View {
        Text("Screen time data:").font(.callout).onAppear{
            requestScreenTimePermission()
            print(DeviceActivityReport(context, filter: filter))
            print("hi")
        }
        DeviceActivityReport(context, filter: filter)
    }
}

#Preview {
    ScreenTimeView()
}
