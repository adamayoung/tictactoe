//
//  GameAction.swift
//  GameFeature
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation

enum GameAction: Sendable {

    case squareTapped(row: Int, column: Int)
    case setIsConfettiPresented(Bool)
    case nextRound
    case finishGame
    case setIsFinishGameAlertPresented(Bool)

}
