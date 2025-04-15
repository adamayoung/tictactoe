//
//  RootComponent.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import LoginFeature
import NeedleFoundation
import WelcomeFeature
import GameFeature
import SwiftUI

public final class RootComponent: BootstrapComponent {

    @MainActor var rootView: some View {
        RootView(
            store: self.store,
            welcomeNavigationStackBuilder: welcomeNavigationStackComponent,
            gameViewBuilder: gameComponent
        )
    }

}

extension RootComponent {

    @MainActor private var store: RootStore {
        shared {
            RootStore(
                initialState: .init(),
                reducer: RootReducer()
            )
        }
    }

}

extension RootComponent {

    private var welcomeNavigationStackComponent: WelcomeNavigationStackComponent {
        WelcomeNavigationStackComponent(parent: self)
    }

    private var gameComponent: GameComponent {
        GameComponent(parent: self)
    }

}
