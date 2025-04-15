//
//  WelcomeNavigationStackBuilder.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import LoginFeature
import Foundation

protocol WelcomeNavigationStackBuilder {

    @MainActor
    func welcomeNavigationStack(startGameAction: @escaping (GameConfig) -> Void) -> WelcomeNavigationStack

}
