//
//  File.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/11.
//

import Foundation
import GameKit
import PencilKit


class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authentivationState = PlayerAuthState.authenticating
    
    @Published var currentlydrawing = true      /*true*/
    @Published var drawPrompt = ""                 /*Dishwasher*/
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local
    
    var playerUUIDKey = UUID().uuidString //uu for unique id
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
        
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }
            if let error = e {
                authentivationState = .error
                print(error.localizedDescription)
                return
            }
            if localPlayer.isAuthenticated {
                 
                if localPlayer.isMultiplayerGamingRestricted {
                    authentivationState = .restricted
                }
                
            } else {
                authentivationState = .unauthenticated
            }
        }
    }
    
    func startMatchMaking() {
        let request =
        GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        
//        let matchmakingVC = GKMatchmakerViewController(matchRequest: request)
       
    }
}
