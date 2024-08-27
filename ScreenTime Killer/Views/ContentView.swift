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
        Image("zombie-phone")
            .resizable()
            .offset(x: -11)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle()).overlay {
                Circle().stroke(.white, lineWidth: 4)
            }.scaleEffect(CGSize(width: 0.5, height: 0.5))
            .padding(.bottom, -140)
            .offset(y: -80)
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
