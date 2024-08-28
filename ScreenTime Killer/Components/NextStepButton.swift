//
//  NextStepButton.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 27/08/2024.
//

import SwiftUI

struct NextStepButton: View {
    @State var nextStep: () -> ()
    @State var title: String

    var body: some View {
        Button(title) {
            withAnimation {
                nextStep()
            }
        }
        .buttonStyle(BorderedProminentButtonStyle())
        .accentColor(.black)
        .controlSize(.large)
    }
}


