//
//  LoginState.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import SwiftUI

struct LoginState: Equatable, Sendable {

    var player1Name: String
    var player1Color: Color

    var player2Name: String
    var player2Color: Color

    var gameConfig: GameConfig?

    init(
        player1Name: String = "",
        player1Color: Color = .blue,
        player2Name: String = "",
        player2Color: Color = .red
    ) {
        self.player1Name = player1Name
        self.player1Color = player1Color
        self.player2Name = player2Name
        self.player2Color = player2Color
        self.gameConfig = GameConfig(
            player1Name: player1Name,
            player1Color: player1Color,
            player2Name: player2Name,
            player2Color: player2Color
        )
    }

}
