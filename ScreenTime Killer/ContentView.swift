//
//  ContentView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Screen Time Killer")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(0)
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            Text("Kill your habits, for real this time.")
                .font(.subheadline)
                
            ScreenTimeView().shadow(radius: 7).frame(height: 300)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
