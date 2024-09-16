//
//  File.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import Foundation


class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authentivationState = PlayerAuthState.authenticating
    
    @Published var currentlydrawing = true
    @Published var drawPrompt = "Dishwasher"
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
}
