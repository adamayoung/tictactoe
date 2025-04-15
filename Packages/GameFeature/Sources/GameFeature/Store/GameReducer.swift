//
//  GameReducer.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import SwiftRedux

struct GameReducer: Reducer {

    func reduce(_ oldState: GameState, with action: GameAction) -> GameState {
        var state = oldState

        switch action {
        case .squareTapped(let row, let column):
            state.game.select(row: row, column: column)

        case .nextRound:
            state.game.nextRound()

        case .finishGame:
            state.isFinishGameAlertPresented = true

        case .setIsFinishGameAlertPresented(let isPresented):
            state.isFinishGameAlertPresented = isPresented
        }

        return state
    }

}
