//
//  WelcomeView.swift
//  WelcomeFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

public struct WelcomeView: View {

    private var startAction: () -> Void

    init(startAction: @escaping () -> Void) {
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
    NavigationStack {
        WelcomeView(
            startAction: {
                print("Start")
            }
        )
    }
}
