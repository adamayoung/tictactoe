//
//  RootView.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import LoginFeature
import WelcomeFeature
import GameFeature
import SwiftUI

struct RootView: View {

    @State private var store: RootStore
    private let welcomeNavigationStackBuilder: any WelcomeNavigationStackBuilder
    private let gameViewBuilder: any GameViewBuilder

    private var gameConfig: GameFeature.GameConfig? {
        store.gameConfig
    }

    init(
        store: RootStore,
        welcomeNavigationStackBuilder: some WelcomeNavigationStackBuilder,
        gameViewBuilder: some GameViewBuilder
    ) {
        self._store = .init(wrappedValue: store)
        self.welcomeNavigationStackBuilder = welcomeNavigationStackBuilder
        self.gameViewBuilder = gameViewBuilder
    }

    var body: some View {
        if let gameConfig {
            NavigationStack {
                gameViewBuilder.gameView(config: gameConfig) {
                    endGame()
                }
            }
        } else {
            welcomeNavigationStackBuilder.welcomeNavigationStack { config in
                startGame(config: config)
            }
        }
    }

}

extension RootView {

    private func startGame(config: LoginFeature.GameConfig) {
        Task {
            await store.send(.startGame(config))
        }
    }

    private func endGame() {
        Task {
            await store.send(.endGame)
        }
    }

}

//#Preview {
//
//    @Previewable @State var store = RootStore(
//        initialState: .init(),
//        reducer: RootReducer()
//    )
//
//    RootView(store: store)
//}
