//
//  pacmanView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 05/06/2024.
//

import SwiftUI

struct PacmanView: View {
    @ObservedObject var pacman: Pacman
    @ObservedObject var board: PacmanBoard
    @StateObject private var logic = PacmanLogic();
    @ObservedObject var stats: GameStats;
    @ObservedObject var food: FoodBoard
    @ObservedObject var ghostlogic: GhostLogic
    @ObservedObject var inky: Inky
    @ObservedObject var pinky: Pinky
    @ObservedObject var blinky: Blinky
    @ObservedObject var clyde: Clyde

    var body: some View {
        VStack {
            Image(pacman.image)
                .position(x: CGFloat(pacman.xCoordinate), y: CGFloat(pacman.yCoordinate))
        }
        .onAppear {
            logic.startTimer(pacman: pacman, board: board, food: food, stats: stats, ghostlogic: ghostlogic, inky: inky, blinky: blinky, clyde: clyde, pinky: pinky);
            NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                if event.charactersIgnoringModifiers == "a" && logic.moveLeft(pacman: pacman, board: board) == true {
                    pacman.direction = .left
                }
                else if event.charactersIgnoringModifiers == "w" && logic.moveUp(pacman: pacman, board: board) == true {
                    pacman.direction = .up
                }
                else if event.charactersIgnoringModifiers == "d" && logic.moveRight(pacman: pacman, board: board) == true{
                    pacman.direction = .right
                }
                else if event.charactersIgnoringModifiers == "s" && logic.moveDown(pacman: pacman, board: board) == true {
                    pacman.direction = .down
                }
                return event
            }
        }
        .onDisappear {
                logic.timer?.invalidate()
                }
            }
}
