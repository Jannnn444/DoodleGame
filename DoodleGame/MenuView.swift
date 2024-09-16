//
//  MainView.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import SwiftUI

struct MenuView : View {
    
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding(30)
            
            Spacer()
            Button {
                //TODO: Start Matching menu
            } label: {
                Text("play")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontDesign(.serif)
                    .bold()
            }
            .disabled(matchManager.authentivationState != .authenticated || matchManager.inGame)
            .padding(.vertical,20)
            .padding(.horizontal,100)
            .background(
                Capsule(style: .circular)
                    .fill(matchManager.authentivationState != .authenticated || matchManager.inGame ? .gray: Color("playBtn") )
            )
            Text(matchManager.authentivationState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundStyle(Color("primaryYellow"))
                .padding()
            Spacer()
        }
        .background(
        Image("menuBg")
            .resizable()
            .scaledToFit()
            .scaleEffect(1.05)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    MenuView(matchManager: MatchManager())
}
