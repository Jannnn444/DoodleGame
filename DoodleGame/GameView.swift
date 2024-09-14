//
//  GameView.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/15.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    @State var eraserEnabled = ""
    
    func makeGuess() {
        //TODO: Submit the guess
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlydrawing ? "drawBg" : "guesserBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.1)  //this help fill the entire scrn
                
                VStack {
                   topBar
                }
            }
        }
    }
    var topBar: some View {
        
        ZStack {
            HStack {
                Button {
                    //TODO: Disconnect from game
                } label: {
                    Image(systemName: "arrow.left.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .padding(.vertical, 15)
        
    }
}

#Preview {
    GameView(matchManager: MatchManager())
}
