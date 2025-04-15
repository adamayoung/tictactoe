//
//  SwiftUIView.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

public struct GameView: View {

    @State private var store: GameStore
    private let finishGameAction: () -> Void

    private var player1: Player { store.game.player1 }
    private var player2: Player { store.game.player2 }
    private var board: Board { store.game.board }
    private var winner: Player? { store.game.winner }
    private var isDraw: Bool { store.game.isDraw }
    private var player1Score: Int { store.game.player1Score }
    private var player2Score: Int { store.game.player2Score }
    private var isFinishGameConfirmationAlertPresented: Binding<Bool> {
        store.binding(extract: \.isFinishGameAlertPresented, embed: GameAction.setIsFinishGameAlertPresented)
    }

    init(
        store: GameStore,
        finishGameAction: @escaping () -> Void
    ) {
        self._store = .init(wrappedValue: store)
        self.finishGameAction = finishGameAction
    }

    public var body: some View {
        VStack {
            PlayersView(
                player1: player1,
                player2: player2,
                player1Score: player1Score,
                player2Score: player2Score
            )
            .frame(width: 300)
            .padding(.horizontal)

            BoardView(
                board: board,
                player1: player1,
                player2: player2,
                onTap: onTap
            )

            HStack {
                if let winner {
                    WinView(player: winner, nextRoundAction: nextRound)
                }

                if isDraw {
                    DrawView(nextRoundAction: nextRound)
                }
            }
            .frame(height: 100)
            .opacity(winner == nil && !isDraw ? 0 : 1)
        }
        .alert(
            "Finish Game",
            isPresented: isFinishGameConfirmationAlertPresented,
            actions: {
                Button("Finish", role: .destructive, action: finishGameAction)
                Button("Cancel", role: .cancel, action: {})
            }, message: {
                Text("Are you sure you want to finish the game?")
            })
        .navigationTitle("TicTacToe")
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button("Finish", action: finishGame)
            }
        }
    }

}

extension GameView {

    private func onTap(_ row: Int, _ column: Int) {
        Task { await store.send(.squareTapped(row: row, column: column), animation: .easeInOut) }
    }

    private func nextRound() {
        Task { await store.send(.nextRound, animation: .easeInOut) }
    }

    private func finishGame() {
        Task { await store.send(.finishGame) }
    }

}

#Preview("Game - Start") {
    @Previewable @State var store = GameStore(
        initialState: .init(
            game: .newGamePreview
        ),
        reducer: GameReducer()
    )

    NavigationStack {
        GameView(
            store: store,
            finishGameAction: {
                print("Finish game")
            }
        )
    }
}

#Preview("Game - Mid-game") {
    @Previewable @State var store = GameStore(
        initialState: .init(
            game: .midGamePreview
        ),
        reducer: GameReducer()
    )

    NavigationStack {
        GameView(
            store: store,
            finishGameAction: {
                print("Finish game")
            }
        )
    }
}

#Preview("Game - Player 1 win") {
    @Previewable @State var store = GameStore(
        initialState: .init(
            game: .player1WinPreview
        ),
        reducer: GameReducer()
    )

    NavigationStack {
        GameView(
            store: store,
            finishGameAction: {
                print("Finish game")
            }
        )
    }
}

#Preview("Game - Player 2 win") {
    @Previewable @State var store = GameStore(
        initialState: .init(
            game: .player2WinPreview
        ),
        reducer: GameReducer()
    )

    NavigationStack {
        GameView(
            store: store,
            finishGameAction: {
                print("Finish game")
            }
        )
    }
}

#Preview("Game - Draw") {
    @Previewable @State var store = GameStore(
        initialState: .init(
            game: .drawPreview
        ),
        reducer: GameReducer()
    )

    NavigationStack {
        GameView(
            store: store,
            finishGameAction: {
                print("Finish game")
            }
        )
    }
}
