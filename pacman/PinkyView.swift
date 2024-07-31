//
//  PinkyView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import SwiftUI

struct PinkyView: View {
    @ObservedObject var pinky: Pinky
    @ObservedObject var board: PacmanBoard
    @ObservedObject var ghostlogic: GhostLogic
    @ObservedObject var pacman: Pacman
    @ObservedObject var stats: GameStats
    
    var body: some View {
        VStack {
            Image(pinky.image)
                .position(x: CGFloat(pinky.xCoordinate), y: CGFloat(pinky.yCoordinate))
        }
        .onAppear {
            let pinkyQueue = DispatchQueue(label: "pinky.queue", qos: .userInitiated)
            //ghostlogic.startTimer(ghost: pinky, board: board, pacman: pacman, stats: stats);
                let directions: [Direction] = [.left, .right, .up, .down]
                let randomDirection = directions.randomElement()!
                if randomDirection == .left && ghostlogic.moveLeft(ghost: pinky, board: board) == true {
                    pinky.direction = .left
                }
                else if randomDirection == .up && ghostlogic.moveUp(ghost: pinky, board: board) == true {
                    pinky.direction = .up
                }
                else if randomDirection == .right && ghostlogic.moveRight(ghost: pinky, board: board) == true {
                    pinky.direction = .right
                }
                else if randomDirection == .down && ghostlogic.moveDown(ghost: pinky, board: board) == true {
                    pinky.direction = .down
                }
                
        }
        .onDisappear {
                ghostlogic.timer?.invalidate()
                }
    }
}
