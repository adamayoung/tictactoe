//
//  GameState.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

struct GameState: Equatable, Sendable {

    var game: Game
    var isConfettiPresented: Bool
    var isFinishGameAlertPresented: Bool

    init(
        game: Game,
        isConfettiPresented: Bool = false,
        isFinishGameAlertPresented: Bool = false
    ) {
        self.game = game
        self.isConfettiPresented = isConfettiPresented
        self.isFinishGameAlertPresented = isFinishGameAlertPresented
    }

}
