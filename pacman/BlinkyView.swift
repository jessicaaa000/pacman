//
//  BlinkyView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import SwiftUI

struct BlinkyView: View {
    @ObservedObject var blinky: Blinky
    @ObservedObject var board: PacmanBoard
    @ObservedObject var ghostlogic: GhostLogic
    @ObservedObject var pacman: Pacman
    @ObservedObject var stats: GameStats
    
    var body: some View {
        VStack {
            Image(blinky.image)
                .position(x: CGFloat(blinky.xCoordinate), y: CGFloat(blinky.yCoordinate))
        }
        .onAppear {
            let blinkyQueue = DispatchQueue(label: "blinky.queue", qos: .userInitiated)
            ghostlogic.startTimer(ghost: blinky, board: board, pacman: pacman, stats: stats);
                let directions: [Direction] = [.left, .right, .up, .down, .none]
                let randomDirection = directions.randomElement()!
                if randomDirection == .left && ghostlogic.moveLeft(ghost: blinky, board: board) == true {
                    blinky.direction = .left
                }
                else if randomDirection == .up && ghostlogic.moveUp(ghost: blinky, board: board) == true {
                    blinky.direction = .up
                }
                else if randomDirection == .right && ghostlogic.moveRight(ghost: blinky, board: board) == true {
                    blinky.direction = .right
                }
                else if randomDirection == .down && ghostlogic.moveDown(ghost: blinky, board: board) == true {
                    blinky.direction = .down
                }
                
        }
        .onDisappear {
                ghostlogic.timer?.invalidate()
                }
    }
}
