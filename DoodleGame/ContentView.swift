//
//  ContentView.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var matchManager = MatchManager() //Differnces between the : ?
    var body: some View {
        ZStack{
            
            //MARK: Deal with views we need to show in differ cases
            
            if matchManager.isGameOver {
                GameOverView(matchManager: matchManager)
            } else if matchManager.inGame {
                GameView(matchManager: matchManager)
            } else {
                MenuView(matchManager: matchManager)
            }
        }
        .onAppear() {
            matchManager.authenticateUser()
            //when this ContentView Appeared, jump authenticateUser()
        }
    }
}

#Preview {
    ContentView()
}
