//
//  WelcomeComponent.swift
//  WelcomeFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import NeedleFoundation

public final class WelcomeComponent: Component<WelcomeDependency>, WelcomeViewBuilder {

    public func welcomeView(startAction: @escaping () -> Void) -> WelcomeView {
        WelcomeView(
            startAction: startAction
        )
    }

}
