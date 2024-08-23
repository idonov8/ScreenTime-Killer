//
//  CircularLogo.swift
//  ScreenTime Killer
//
//  Created by Ido Nov on 23/08/2024.
//

import SwiftUI

struct CircularLogo: View {
    var body: some View {
        Image(.screenTimeKillerIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle()).overlay {
                Circle().stroke(.white, lineWidth: 4)
        }

    }
}

#Preview {
    CircularLogo()
}
