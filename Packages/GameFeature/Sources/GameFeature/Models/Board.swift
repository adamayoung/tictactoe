//
//  Board.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

struct Board: Equatable {

    private(set) var squares: [[Square]]

    init(
        squares: [[Square]] = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    ) {
        self.squares = squares
    }

    func isSquareEmpty(row: Int, column: Int) -> Bool {
        squares[row][column] == .empty
    }

    func squareAt(row: Int, column: Int) -> Square {
        squares[row][column]
    }

    mutating func change(row: Int, column: Int, to square: Square) {
        squares[row][column] = square
    }

}
