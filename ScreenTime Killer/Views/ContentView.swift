//
//  ContentView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 20/08/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionManager

    var body: some View {
       Text("I'm watching you...")
    }
}

#Preview {
    ContentView()
        .environmentObject(SessionManager())
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//               .environmentObject(SessionManager())
//    }
//}
