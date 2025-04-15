//
//  LoginReducer.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import SwiftRedux

struct LoginReducer: Reducer {

    func reduce(_ oldState: LoginState, with action: LoginAction) -> LoginState {
        var state = oldState

        switch action {
        case .setPlayer1Name(let name):
            state.player1Name = name
            state.gameConfig = Self.gameConfig(state)

        case .setPlayer1Color(let color):
            state.player1Color = color

        case .setPlayer2Name(let name):
            state.player2Name = name
            state.gameConfig = Self.gameConfig(state)

        case .setPlayer2Color(let color):
            state.player2Color = color
        }

        return state
    }

}

extension LoginReducer {

    private static func gameConfig(_ state: LoginState) -> GameConfig? {
        GameConfig(
            player1Name: state.player1Name,
            player1Color: state.player1Color,
            player2Name: state.player2Name,
            player2Color: state.player2Color
        )
    }

}
