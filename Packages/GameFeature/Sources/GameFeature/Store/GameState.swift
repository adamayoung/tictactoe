//
//  GameState.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

struct GameState: Equatable, Sendable {

    var game: Game
    var isFinishGameAlertPresented: Bool

    init(
        game: Game,
        isFinishGameAlertPresented: Bool = false
    ) {
        self.game = game
        self.isFinishGameAlertPresented = isFinishGameAlertPresented
    }

}
