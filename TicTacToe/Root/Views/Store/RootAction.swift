//
//  RootAction.swift
//  TicTacToe
//
//  Created by Adam Young on 15/04/2025.
//

import Foundation
import LoginFeature

enum RootAction: Sendable {

    case startGame(GameConfig)
    case endGame

}
