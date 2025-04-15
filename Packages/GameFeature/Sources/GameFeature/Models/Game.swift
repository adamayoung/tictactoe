//
//  Game.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

struct Game: Equatable, Sendable {

    let player1: Player
    let player2: Player

    private(set) var board: Board
    private(set) var currentRound: Round
    private(set) var player1Score = 0
    private(set) var player2Score = 0

    var winner: Player? {
        switch currentRound.status {
        case .player1Win:
            return player1
        case .player2Win:
            return player2
        default:
            return nil
        }
    }

    var isDraw: Bool {
        currentRound.status == .draw
    }

    init(
        player1: Player,
        player2: Player,
        board: Board = Board(),
        currentRound: Round = Round(),
        player1Score: Int = 0,
        player2Score: Int = 0
    ) {
        self.player1 = player1
        self.player2 = player2
        self.board = board
        self.currentRound = currentRound
        self.player1Score = player1Score
        self.player2Score = player2Score

        if currentRound.currentPlayer == nil {
            self.currentRound.currentPlayer = player1
        }

        self.currentRound.status = roundStatus()
    }

    func isSquareEmpty(row: Int, column: Int) -> Bool {
        board.squares[row][column] == .empty
    }

    func squareAt(row: Int, column: Int) -> Square {
        board.squares[row][column]
    }

    mutating func select(row: Int, column: Int) {
        guard currentRound.status == .playing else {
            return
        }

        guard board.isSquareEmpty(row: row, column: column) else {
            return
        }

        let newSquare: Square = {
            if currentRound.currentPlayer == player1 {
                return .player1
            } else {
                return .player2
            }
        }()

        board.change(row: row, column: column, to: newSquare)
        currentRound.status = roundStatus()

        switch currentRound.status {
        case .player1Win:
            player1Score += 1
            return
        case .player2Win:
            player2Score += 1
            return
        default:
            break
        }

        currentRound.currentPlayer = currentRound.currentPlayer == player1 ? player2 : player1
    }

    mutating func nextRound() {
        self.currentRound = Round(currentPlayer: player1)
        self.board = Board()
    }


}

extension Game {

    private func roundStatus() -> RoundStatus {
        if board.squares.flatMap({ $0 }).count(where: { $0 == .empty }) == 0 {
            return .draw
        }

        let squares = board.squares
        let lines = [
            // Rows
            [squares[0][0], squares[0][1], squares[0][2]],
            [squares[1][0], squares[1][1], squares[1][2]],
            [squares[2][0], squares[2][1], squares[2][2]],
            // Columns
            [squares[0][0], squares[1][0], squares[2][0]],
            [squares[0][1], squares[1][1], squares[2][1]],
            [squares[0][2], squares[1][2], squares[2][2]],
            // Diagonals
            [squares[0][0], squares[1][1], squares[2][2]],
            [squares[0][2], squares[1][1], squares[2][0]],
        ]

        for line in lines {
            if line.allSatisfy({ $0 == .player1 }) {
                return .player1Win
            } else if line.allSatisfy({ $0 == .player2 }) {
                return .player2Win
            }
        }

        return .playing
    }

}
