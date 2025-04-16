//
//  LoginView.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

public struct LoginView: View {

    private enum FocusField: Hashable {
        case player1Name
        case player1Color
        case player2Name
        case player2Color
    }

    @State private var store: LoginStore
    @FocusState private var focusedField: FocusField?

    private var player1Name: Binding<String> {
        store.binding(extract: \.player1Name, embed: LoginAction.setPlayer1Name)
    }

    private var player1Color: Binding<Color> {
        store.binding(extract: \.player1Color, embed: LoginAction.setPlayer1Color)
    }

    private var player2Name: Binding<String> {
        store.binding(extract: \.player2Name, embed: LoginAction.setPlayer2Name)
    }

    private var player2Color: Binding<Color> {
        store.binding(extract: \.player2Color, embed: LoginAction.setPlayer2Color)
    }

    private var canStartGame: Bool {
        store.gameConfig != nil
    }

    private var startGameAction: (GameConfig) -> Void

    init(
        store: LoginStore,
        startGameAction: @escaping (GameConfig) -> Void
    ) {
        self._store = .init(wrappedValue: store)
        self.startGameAction = startGameAction
    }

    public var body: some View {
        Form {
            Section("Player 1") {
                TextField(text: player1Name) {
                    Text("Name")
                }
                .focused($focusedField, equals: .player1Name)

                ColorPicker("Color", selection: player1Color)
                    .focused($focusedField, equals: .player1Color)
            }

            Section("Player 2") {
                TextField(text: player2Name) {
                    Text("Name")
                }
                .focused($focusedField, equals: .player2Name)

                ColorPicker("Color", selection: player2Color)
                    .focused($focusedField, equals: .player2Color)
            }

            Section {
                HStack {
                    Spacer()
                    Button {
                        startGame()
                    } label: {
                        Text("Start")
                    }
                    Spacer()
                }
                .disabled(!canStartGame)
            }
        }
        .formStyle(.grouped)
        .onAppear {
            focusedField = .player1Name
        }
        .navigationTitle("New Game")
    }

}

extension LoginView {

    private func startGame() {
        guard let gameConfig = store.gameConfig else {
            return
        }

        startGameAction(gameConfig)
    }

}


#Preview("Login - Empty") {
    @Previewable @State var store = LoginStore(
        initialState: .init(),
        reducer: LoginReducer()
    )

    NavigationStack {
        LoginView(
            store: store,
            startGameAction: { _ in
                print("Start game")
            }
        )
    }
}

#Preview("Login - With players") {
    @Previewable @State var store = LoginStore(
        initialState: .init(
            player1Name: "Dave",
            player1Color: .green,
            player2Name: "John",
            player2Color: .orange
        ),
        reducer: LoginReducer()
    )

    NavigationStack {
        LoginView(
            store: store,
            startGameAction: { _ in
                print("Start game")
            }
        )
    }
}
