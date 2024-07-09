//
//  InkyView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import SwiftUI

struct InkyView: View {
    @ObservedObject var inky: Inky
    @ObservedObject var board: PacmanBoard
    @ObservedObject var ghostlogic: GhostLogic
    @ObservedObject var pacman: Pacman
    @ObservedObject var stats: GameStats
    
    var body: some View {
        VStack {
            Image(inky.image)
                .position(x: CGFloat(inky.xCoordinate), y: CGFloat(inky.yCoordinate))
        }
        .onAppear {
            DispatchQueue.main.async {
                ghostlogic.startTimer(ghost: inky, board: board, pacman: pacman, stats: stats)
                
                // Randomize initial direction
                let directions: [Direction] = [.left, .right, .up, .down, .none]
                let randomDirection = directions.randomElement()!
                switch randomDirection {
                case .left:
                    if ghostlogic.moveLeft(ghost: inky, board: board) {
                        inky.direction = .left
                    }
                case .right:
                    if ghostlogic.moveRight(ghost: inky, board: board) {
                        inky.direction = .right
                    }
                case .up:
                    if ghostlogic.moveUp(ghost: inky, board: board) {
                        inky.direction = .up
                    }
                case .down:
                    if ghostlogic.moveDown(ghost: inky, board: board) {
                        inky.direction = .down
                    }
                case .none:
                    break
                }
            }
        }
        .onDisappear {
            ghostlogic.timer?.invalidate()
        }
    }
}
