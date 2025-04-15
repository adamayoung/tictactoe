//
//  SwiftUIView.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

struct WinView: View {

    var player: Player
    var nextRoundAction: () -> Void

    var body: some View {
        VStack {
            Text("\(player.name) wins")

            Button("Next Round", action: nextRoundAction)
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    WinView(
        player: .player1Preview,
        nextRoundAction: {}
    )
}
