//
//  SwiftUIView.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

struct PlayersView: View {

    var player1: Player
    var player2: Player
    var player1Score: Int
    var player2Score: Int

    var body: some View {
        HStack {
            Label(player1.name, systemImage: "person.fill")
                .foregroundStyle(player1.color)

            Spacer()

            HStack {
                Text("\(player1Score)")
                    .font(.headline)

                Text(" - ")

                Text("\(player2Score)")
                    .font(.headline)
            }

            Spacer()

            Label(player2.name, systemImage: "person.fill")
                .foregroundStyle(player2.color)
        }
    }

}

#Preview {
    PlayersView(
        player1: .player1Preview,
        player2: .player2Preview,
        player1Score: 1,
        player2Score: 3
    )
    .padding()
}
