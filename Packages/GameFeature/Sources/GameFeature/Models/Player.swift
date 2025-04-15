//
//  Player.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import SwiftUI

public struct Player: Equatable, Identifiable, Sendable {

    public var id: String {
        name
    }

    public let name: String
    public let color: Color

    public init(name: String, color: Color) {
        self.name = name
        self.color = color
    }

}
