//
//  DisplayConfettiModifier.swift
//  GameFeature
//
//  Created by Adam Young on 16/04/2025.
//

import SwiftUI

struct DisplayConfettiModifier: ViewModifier {

    @Binding var isActive: Bool {
        didSet {
            if !isActive {
                opacity = 1
            }
        }
    }

    @State private var opacity = 1.0 {
        didSet {
            if opacity == 0 {
                isActive = false
            }
        }
    }

    private let animationTime = 3.0
    private let fadeTime = 2.0

    init(isActive: Binding<Bool>) {
        self._isActive = isActive
        self.opacity = isActive.wrappedValue ?  0 : 1
    }

    func body(content: Content) -> some View {
        content
            .overlay(isActive ? ConfettiContainerView().opacity(opacity) : nil)
            .sensoryFeedback(.success, trigger: isActive)
    }


}

extension View {

    func displayConfetti(isActive: Binding<Bool>) -> some View {
        self.modifier(DisplayConfettiModifier(isActive: isActive))
    }

}
