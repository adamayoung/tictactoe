//
//  WelcomeComponent.swift
//  WelcomeFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import NeedleFoundation
import SwiftUI

public final class WelcomeComponent: Component<WelcomeDependency>, WelcomeViewBuilder {

    public func welcomeView(startAction: @escaping () -> Void) -> WelcomeView {
        WelcomeView(
            store: self.store,
            startAction: startAction
        )
    }

}

extension WelcomeComponent {

    @MainActor
    private var store: WelcomeStore {
        WelcomeStore(
            initialState: .init(),
            reducer: WelcomeReducer()
        )
    }

}
