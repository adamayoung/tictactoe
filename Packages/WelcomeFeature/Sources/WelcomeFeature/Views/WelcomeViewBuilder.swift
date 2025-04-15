//
//  WelcomeViewBuilder.swift
//  WelcomeFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

public protocol WelcomeViewBuilder {

    @MainActor
    func welcomeView(startAction: @escaping () -> Void) -> WelcomeView

}
