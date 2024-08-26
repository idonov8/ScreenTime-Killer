//
//  SetPriceView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 26/08/2024.
//

import SwiftUI

struct SetPriceView: View {
    var body: some View {
        Text("Set your price 💸")
            .font(.title)
        Text("Choose a sum of money will make you stick to your goal")
            .font(.title2)
            .multilineTextAlignment(.center)
            .fontWeight(.light)
    }
}

#Preview {
    SetPriceView()
}
