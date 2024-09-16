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
    @State var eraserEnabled = false
    
    func makeGuess() {
        //TODO: Submit the guess
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlydrawing ? "drawerBg" : "guesserBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.1)  //this help fill the entire scrn
                
                VStack {
                    topBar
                    
                    ZStack {
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay (
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 10)
                            )
                            .padding()
                           
                        
                        VStack {
                            HStack{
                                Spacer() // this push h in H to the left
                                if matchManager.currentlydrawing {  //if is true
                                    Button {
                                        eraserEnabled.toggle()
                                    } label: {
                                        Image(systemName: eraserEnabled ? "eraser.fill" : "eraser")
                                            .font(.title)
                                            .foregroundStyle(Color("primaryPurple"))
                                            .padding(.top, 10)
                                    }
                                }
                                   
                            }

                            .padding()
                            // this push the H eraser up to top of V
                            // Result: on the top left by spacer
                            Spacer()
                            
                        }
                        .padding()
                    }
                    
                    //MARK: Past Guessses (outside zstack)
                    pastGuess
                    
                }
                .padding(.horizontal, 30)
                .ignoresSafeArea(.keyboard, edges: .bottom)
               
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
                        .font(.largeTitle)
                        .frame(width: 50, height: 50)
                        .tint(Color(matchManager.currentlydrawing ? "primayYellow" : "primaryPurple"))
                    
                    // NOTE: GridGame Logic
                    /*
                     
                     1. .fill(Color(observedObjectPage.currentChoice ? "red" : "black"))
                     2.  [false, false, true, false, false, false, false, false]
                     3.  [false, false, false, true, false, false, false, false]
                     4.  [false, false, false, false, false, true, false, false]
                     
                     */
                }
                Spacer()
                
                
                Label("\(matchManager.remainingTime)", systemImage: "clock.fill")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color(matchManager.currentlydrawing ? "primaryYellow" : "primaryPurple"))
            }
           
        }
        .padding(.vertical, 15)
    }
    //MARK: Here for saving some passed guesses
    var pastGuess: some View {
        ScrollView {
            ForEach(matchManager.pastGuesses) { guess in
                HStack {
                    Text(guess.message)
                        .font(.title2)
                        .bold(guess.correct)
                    
                    if guess.correct {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(matchManager.currentlydrawing ? Color(red: 0.888, green: 0.345, blue: 0.776) : Color(red: 0.243, green: 0.773, blue: 0.745))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 1)
        }
        .padding()
        .frame(width: .infinity)
        .background(
            (matchManager.currentlydrawing ? Color(red: 0.243, green: 0.773, blue: 0.745) : Color("primaryYellow"))
                .brightness(-0.2)
                .opacity(0.5)
               
        )
        .cornerRadius(20)
        .padding(.vertical)
        .padding(.bottom, 120)
    }
        

}

#Preview {
    GameView(matchManager: MatchManager())
}
