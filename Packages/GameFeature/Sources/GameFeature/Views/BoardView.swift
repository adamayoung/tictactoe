//
//  BoardView.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

struct BoardView: View {

    var board: Board
    var player1: Player
    var player2: Player
    var onTap: (Int, Int) -> Void

    var body: some View {
        Grid(horizontalSpacing: -1, verticalSpacing: -1) {
            ForEach(0..<board.squares.count, id: \.self) { rowIndex in
                GridRow {
                    ForEach(0..<board.squares[rowIndex].count, id: \.self) { columnIndex in
                        cell(for: rowIndex, column: columnIndex)
                            .onTapGesture {
                                self.onTap(rowIndex, columnIndex)
                            }
                    }
                }
            }
        }
        .animation(.easeInOut, value: board.squares)
    }

    private func cell(for row: Int, column: Int) -> some View {
        Rectangle()
            .foregroundStyle(.background)
            .frame(width: 100, height: 100)
            .border(.black)
            .overlay {
                marker(for: board.squares[row][column])
            }
    }

    @ViewBuilder
    private func marker(for square: Square) -> some View {
        switch square {
        case .empty:
            EmptyView()
        case .player1:
            Text("X")
                .foregroundStyle(player1.color)
                .font(.largeTitle)
                .fontWeight(.black)

        case .player2:
            Text("O")
                .foregroundStyle(player2.color)
                .font(.largeTitle)
                .fontWeight(.black)
        }
    }

}

#Preview("Board - Start") {
    BoardView(
        board: .emptyPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { _, _ in }
    )
}

#Preview("Board - Mid-round") {
    BoardView(
        board: .midRoundPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { _, _ in }
    )
}

#Preview("Board - Player 1 win") {
    BoardView(
        board: .player1WinPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { _, _ in }
    )
}

#Preview("Board - Player 2 win") {
    BoardView(
        board: .player2WinPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { _, _ in }
    )
}
