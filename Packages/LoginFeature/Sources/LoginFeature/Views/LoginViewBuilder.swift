//
//  LoginViewBuilder.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

public protocol LoginViewBuilder {

    @MainActor
    func loginView(startGameAction: @escaping (GameConfig) -> Void) -> LoginView

}
