//
//  GameViewBuilder.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

public protocol GameViewBuilder {

    @MainActor
    func gameView(config: GameConfig, finishGameAction: @escaping () -> Void) -> GameView

}
