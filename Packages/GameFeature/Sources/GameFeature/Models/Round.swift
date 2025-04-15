//
//  Round.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

struct Round: Equatable, Sendable {

    var currentPlayer: Player?
    var winner: Player?

    init(
        currentPlayer: Player? = nil,
        winner: Player? = nil
    ) {
        self.currentPlayer = currentPlayer
        self.winner = winner
    }

}
