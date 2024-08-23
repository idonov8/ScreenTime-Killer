//
//  StepsScreen.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 23/08/2024.
//

import SwiftUI

struct StepsScreen: View {
    var body: some View {
        Text("It's pretty Simple")
            .font(.largeTitle)
        VStack(alignment: .leading) {
            Text("1. Set screen time goal")
            Text("2. Set price to pay if you don't reach the goal")
            Text("3. Stick to your goal! or pay the price...")
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StepsScreen()
}
