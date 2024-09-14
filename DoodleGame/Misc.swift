//
//  Misc.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import Foundation

let everydayObjects = [
    "apple", "banana", "chair", "book", "pencil", "laptop", "cup", "table", "watch", "phone","pen", "car", "house", "shoe", "glasses", "bag", "key", "tree", "clock", "bottle","scissors", "spoon", "fork", "plate", "towel", "ball", "lamp", "couch", "camera", "door","window", "umbrella", "hat", "toothbrush", "soap", "bed", "fan", "television", "bicycle", "keyboard","mouse", "wallet", "ring", "notebook", "headphones", "glove", "mirror", "socks", "t-shirt", "jacket"
]

enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center"
    case unauthenticated = "Please sign in to Game Center to play"
    case authenticated = ""
    
    case error = "An error occured logging into Game center"
    case restricted = "You're not allowed to play multiplayer games!"
}


struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100
