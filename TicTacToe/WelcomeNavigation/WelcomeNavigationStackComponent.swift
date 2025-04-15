//
//  WelcomeNavigationStackComponent.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import LoginFeature
import WelcomeFeature
import NeedleFoundation
import SwiftUI

final class WelcomeNavigationStackComponent: Component<WelcomeNavigationStackDependency>, WelcomeNavigationStackBuilder {

    func welcomeNavigationStack(startGameAction: @escaping (GameConfig) -> Void) -> WelcomeNavigationStack {
        WelcomeNavigationStack(
            welcomeBuilder: welcomeComponent,
            loginBuilder: loginComponent,
            startGameAction: startGameAction
        )
    }

}

extension WelcomeNavigationStackComponent {

    private var welcomeComponent: WelcomeComponent {
        WelcomeComponent(parent: self)
    }

    private var loginComponent: LoginComponent {
        LoginComponent(parent: self)
    }

}
