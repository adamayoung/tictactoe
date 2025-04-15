//
//  RootState.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import GameFeature

struct RootState: Equatable, Sendable {

    var gameConfig: GameConfig?

    init(
        gameConfig: GameConfig? = nil
    ) {
        self.gameConfig = gameConfig
    }

}
