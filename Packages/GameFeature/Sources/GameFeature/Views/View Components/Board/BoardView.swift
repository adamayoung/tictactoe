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
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            ForEach(0..<board.squares.count, id: \.self) { rowIndex in
                GridRow {
                    ForEach(0..<board.squares[rowIndex].count, id: \.self) { columnIndex in
                        cell(for: rowIndex, column: columnIndex)
                            .padding(8)
                            .sensoryFeedback(.success, trigger: board.squares)
                            .onTapGesture {
                                self.onTap(rowIndex, columnIndex)
                            }
                    }
                }
            }
        }
        .aspectRatio(contentMode: .fit)
        .animation(.bouncy(duration: 0.25, extraBounce: 0.3), value: board.squares)
    }

    private func cell(for row: Int, column: Int) -> some View {
        Rectangle()
            .foregroundStyle(Color.secondary.opacity(0.2))
            .cornerRadius(30)
            .overlay {
                marker(for: board.squares[row][column])
                    .fontWeight(.black)
            }
    }

    @ViewBuilder
    private func marker(for square: Square) -> some View {
        switch square {
        case .empty:
            EmptyView()
        case .player1:
            Image(systemName: "xmark")
                .resizable()
                .padding(30)
                .foregroundStyle(player1.color)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))

        case .player2:
            Image(systemName: "circle")
                .resizable()
                .padding(30)
                .foregroundStyle(player2.color)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }

}

#Preview("Board - Start") {
    BoardView(
        board: .emptyPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { row, column in
            print("Tapped row: \(row), column: \(column)")
        }
    )
}

#Preview("Board - Mid-round") {
    BoardView(
        board: .midRoundPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { row, column in
            print("Tapped row: \(row), column: \(column)")
        }
    )
}

#Preview("Board - Player 1 win") {
    BoardView(
        board: .player1WinPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { row, column in
            print("Tapped row: \(row), column: \(column)")
        }
    )
}

#Preview("Board - Player 2 win") {
    BoardView(
        board: .player2WinPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { row, column in
            print("Tapped row: \(row), column: \(column)")
        }
    )
}

#Preview("Board - Draw") {
    BoardView(
        board: .drawPreview,
        player1: .player1Preview,
        player2: .player2Preview,
        onTap: { row, column in
            print("Tapped row: \(row), column: \(column)")
        }
    )
}
