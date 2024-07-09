//
//  ClydeView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import SwiftUI

struct ClydeView: View {
    @ObservedObject var clyde: Clyde
    @ObservedObject var board: PacmanBoard
    @ObservedObject var ghostlogic: GhostLogic
    @ObservedObject var pacman: Pacman
    @ObservedObject var stats: GameStats
    
    var body: some View {
        VStack {
            Image(clyde.image)
                .position(x: CGFloat(clyde.xCoordinate), y: CGFloat(clyde.yCoordinate))
        }
        .onAppear {
            let clydeQueue = DispatchQueue(label: "clyde.queue", qos: .userInitiated)
            ghostlogic.startTimer(ghost: clyde, board: board, pacman: pacman, stats: stats);
                let directions: [Direction] = [.left, .right, .up, .down]
                let randomDirection = directions.randomElement()!
                if randomDirection == .left && ghostlogic.moveLeft(ghost: clyde, board: board) == true {
                    clyde.direction = .left
                }
                else if randomDirection == .up && ghostlogic.moveUp(ghost: clyde, board: board) == true {
                    clyde.direction = .up
                }
                else if randomDirection == .right && ghostlogic.moveRight(ghost: clyde, board: board) == true {
                    clyde.direction = .right
                }
                else if randomDirection == .down && ghostlogic.moveDown(ghost: clyde, board: board) == true {
                    clyde.direction = .down
                }
                
        }
        .onDisappear {
                ghostlogic.timer?.invalidate()
                }
    }
}
