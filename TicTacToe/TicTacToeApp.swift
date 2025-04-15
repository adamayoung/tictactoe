//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

@main
struct TicTacToeApp: App {

    let rootComponent: RootComponent

    init() {
        registerProviderFactories()
        self.rootComponent = RootComponent()
    }

    var body: some Scene {
        WindowGroup {
            rootComponent.rootView
        }
    }

}
