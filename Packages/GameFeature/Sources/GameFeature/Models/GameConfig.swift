//
//  GameConfig.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

public struct GameConfig: Equatable, Sendable {

    public let player1: Player
    public let player2: Player

    public init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }

}
