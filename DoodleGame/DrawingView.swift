//
//  DrawingView.swift
//  DoodleGame
//
//  Created by yucian huang on 2024/9/16.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var matchManager: MatchManager
        
        init(matchManager: MatchManager) {
            self.matchManager = matchManager
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            //TODO: Send the new date
        }
    }
    
    var canvaView = PKCanvasView()
    
    @ObservedObject var matchManager: MatchManager
    @Binding var eraserEnabled: Bool
    

    
    func makeUIView(context: Context) -> PKCanvasView {
        canvaView.drawingPolicy = .anyInput
        canvaView.tool = PKInkingTool(.pen, color: .black, width: 5)
        canvaView.delegate = context.coordinator 
        canvaView.isUserInteractionEnabled = matchManager.currentlydrawing
        
        return canvaView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(matchManager: matchManager)
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //TODO: Hanadle various updates
        
        canvaView.tool = eraserEnabled ? PKEraserTool(.vector) : PKInkingTool(.pen, color: .black, width: 5)
    }
}

