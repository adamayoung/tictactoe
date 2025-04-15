//
//  GameComponent.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import NeedleFoundation
import SwiftUI

public final class GameComponent: Component<GameDependency>, GameViewBuilder {

    public func gameView(config: GameConfig, finishGameAction: @escaping () -> Void) -> GameView {
        GameView(
            store: self.store(config: config),
            finishGameAction: finishGameAction
        )
    }

}

extension GameComponent {

    @MainActor
    private func store(config: GameConfig) -> GameStore {
        GameStore(
            initialState: .init(
                game: Game(
                    player1: config.player1,
                    player2: config.player2
                )
            ),
            reducer: GameReducer()
        )
    }

}
