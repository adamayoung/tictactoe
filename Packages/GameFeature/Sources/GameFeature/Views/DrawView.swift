//
//  SwiftUIView.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import SwiftUI

struct DrawView: View {

    var nextRoundAction: () -> Void

    var body: some View {
        VStack {
            Text("It's a draw!")

            Button("Next Round", action: nextRoundAction)
                .buttonStyle(.borderedProminent)
        }
    }

}

#Preview {
    DrawView(nextRoundAction: {})
}
