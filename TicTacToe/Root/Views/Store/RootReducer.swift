//
//  RootReducer.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import LoginFeature
import GameFeature
import SwiftRedux

struct RootReducer: Reducer {

    func reduce(_ oldState: RootState, with action: RootAction) -> RootState {
        var state = oldState

        switch action {
        case .startGame(let config):
            let player1 = GameFeature.Player(name: config.player1.name, color: config.player1.color)
            let player2 = GameFeature.Player(name: config.player2.name, color: config.player2.color)

            let gameConfig = GameFeature.GameConfig(
                player1: player1,
                player2: player2
            )

            state.gameConfig = gameConfig

        case .endGame:
            state.gameConfig = nil
        }

        return state
    }

}
