//
//  WelcomeNavigationStack.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import LoginFeature
import WelcomeFeature
import SwiftUI

struct WelcomeNavigationStack: View {

    private enum Route: Hashable {
        case login
    }

    @State private var navigationPath: [Route] = []
    private let welcomeBuilder: any WelcomeViewBuilder
    private let loginBuilder: any LoginViewBuilder
    private let startGameAction: (GameConfig) -> Void

    init(
        welcomeBuilder: some WelcomeViewBuilder,
        loginBuilder: some LoginViewBuilder,
        startGameAction: @escaping (GameConfig) -> Void
    ) {
        self.welcomeBuilder = welcomeBuilder
        self.loginBuilder = loginBuilder
        self.startGameAction = startGameAction
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            welcomeBuilder.welcomeView {
                navigationPath.append(.login)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .login:
                    loginBuilder.loginView { gameConfig in
                        startGameAction(gameConfig)
                    }
                }
            }
        }
    }
}
