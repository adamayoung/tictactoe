//
//  Player.swift
//  LoginFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import SwiftUI

public struct Player: Equatable, Sendable {

    public let name: String
    public let color: Color

    public init(name: String, color: Color) {
        self.name = name
        self.color = color
    }

}
