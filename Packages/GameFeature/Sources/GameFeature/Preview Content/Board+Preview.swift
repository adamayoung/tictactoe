//
//  Board+Preview.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

extension Board {

    static var emptyPreview: Board {
        Board()
    }

    static var midRoundPreview: Board {
        Board(
            squares: [
                [.player1, .empty, .player2],
                [.empty, .player2, .empty],
                [.player1, .empty, .empty]
            ]
        )
    }

    static var player1WinPreview: Board {
        Board(
            squares: [
                [.player1, .empty, .player2],
                [.player1, .empty, .player2],
                [.player1, .empty, .empty]
            ]
        )
    }

    static var player2WinPreview: Board {
        Board(
            squares: [
                [.player1, .player1, .player2],
                [.player1, .empty, .player2],
                [.empty, .empty, .player2]
            ]
        )
    }

}
