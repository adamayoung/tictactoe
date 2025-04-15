//
//  LoginComponent.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import NeedleFoundation
import SwiftUI

public final class LoginComponent: Component<LoginDependency>, LoginViewBuilder {

    public func loginView(startGameAction: @escaping (GameConfig) -> Void) -> LoginView {
        LoginView(
            store: self.store,
            startGameAction: startGameAction
        )
    }

}

extension LoginComponent {

    @MainActor
    private var store: LoginStore {
        LoginStore(
            initialState: .init(),
            reducer: LoginReducer()
        )
    }

}
