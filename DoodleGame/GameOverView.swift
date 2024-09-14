//
//  GameOverView.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("gameOver")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 70)
                .padding(.vertical)
            
            Text("Score: \(matchManager.score)")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(Color("primaryYellow"))
            
            Spacer()
            Button {
                //TODO: Go back to menu
            } label: {
                Text("Menu")
                    .foregroundStyle(Color("menuBtn"))
                    .brightness(-0.4)
                    .font(.largeTitle)
                    .bold()
            }
            .disabled(matchManager.authentivationState != .authenticated || matchManager.inGame)
            .padding(.vertical,20)
            .padding(.horizontal,100)
            .background(
                Capsule(style: .circular)
                    .fill(Color("menuBtn"))
            )
            
            Spacer()
        }
        .background(
        Image("gameOverBg")
            .resizable()
            .scaledToFit()
            .scaleEffect(1.05)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    GameOverView(matchManager: MatchManager())
}
