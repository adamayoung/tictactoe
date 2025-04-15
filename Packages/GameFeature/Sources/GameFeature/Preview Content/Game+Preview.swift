//
//  Game+Preview.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

extension Game {

    static var newGamePreview: Game {
        Game(
            player1: .player1Preview,
            player2: .player2Preview,
            board: .emptyPreview
        )
    }

    static var midGamePreview: Game {
        Game(
            player1: .player1Preview,
            player2: .player2Preview,
            board: .midRoundPreview
        )
    }

    static var player1WinPreview: Game {
        Game(
            player1: .player1Preview,
            player2: .player2Preview,
            board: .player1WinPreview
        )
    }

    static var player2WinPreview: Game {
        Game(
            player1: .player1Preview,
            player2: .player2Preview,
            board: .player2WinPreview
        )
    }

    static var drawPreview: Game {
        Game(
            player1: .player1Preview,
            player2: .player2Preview,
            board: .drawPreview
        )
    }

}
