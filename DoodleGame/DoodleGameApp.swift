//
//  DoodleGameApp.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import SwiftUI

@main
struct DoodleGameApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            GameView(matchManager: MatchManager())
        }
    }
}
