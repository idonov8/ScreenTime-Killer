//
//  DaysProgressBar.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 06/09/2024.
//

import SwiftUI

extension Date {
    static func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: Date())!
    }
}

struct DaysProgressBar: View {
    
    let duration: Int
    let startDay: Date
    let failedDays: Set<Date>
    
    var elapsedDays: Int {
        Calendar.current.dateComponents([.day], from: startDay, to: Date()).day ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 3) {
                ForEach(0..<duration, id: \.self) { day in
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(colorForDay(day))
                        .frame(height: 30)
                }
            }
            
            Text("\(duration - elapsedDays) days left to achieve your goal")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
    private func colorForDay(_ day: Int) -> Color {
        let currentDate = Calendar.current.date(byAdding: .day, value: day, to: startDay) ?? startDay
        
        if currentDate > Date() {
            return Color.gray.opacity(0.3) // Future days
        } else if failedDays.contains(currentDate) {
            // TODO: Why doesn't it work?
            return .red // Failed days
        } else {
            return .green // Successful days
        }
    }
}

#Preview {
    DaysProgressBar(duration: 30, startDay: .daysAgo(17), failedDays: [.daysAgo(5),.daysAgo(12)])
}
