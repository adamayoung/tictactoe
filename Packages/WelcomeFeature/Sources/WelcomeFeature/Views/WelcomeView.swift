//
//  WelcomeView.swift
//  WelcomeFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

public struct WelcomeView: View {

    @State private var store: WelcomeStore
    private var startAction: () -> Void

    init(
        store: WelcomeStore,
        startAction: @escaping () -> Void
    ) {
        self._store = .init(wrappedValue: store)
        self.startAction = startAction
    }

    public var body: some View {
        ZStack {
            VStack {
                Text("TicTacToe")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }

            VStack {
                Spacer()
                Button("Start", action: startAction)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.extraLarge)
            }
        }
        .padding(20)
    }

}

#Preview {
    @Previewable @State var store = WelcomeStore(
        initialState: .init(),
        reducer: WelcomeReducer()
    )

    WelcomeView(
        store: store,
        startAction: {}
    )
}
