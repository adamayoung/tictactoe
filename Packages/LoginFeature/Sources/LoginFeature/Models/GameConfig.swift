//
//  GameConfig.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import SwiftUI

public struct GameConfig: Equatable, Sendable {

    public let player1: Player
    public let player2: Player

    public init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }

    init?(
        player1Name: String,
        player1Color: Color,
        player2Name: String,
        player2Color: Color
    ) {
        guard !player1Name.isEmpty else { return nil }
        guard !player2Name.isEmpty else { return nil }

        self.player1 = .init(name: player1Name, color: player1Color)
        self.player2 = .init(name: player2Name, color: player2Color)
    }

}
