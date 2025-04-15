//
//  Round.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

struct Round: Equatable, Sendable {

    var currentPlayer: Player?
    var status: RoundStatus

    init(
        currentPlayer: Player? = nil,
        status: RoundStatus = .playing
    ) {
        self.currentPlayer = currentPlayer
        self.status = status
    }

}
