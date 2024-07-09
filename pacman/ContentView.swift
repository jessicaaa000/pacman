//
//  ContentView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = PacmanBoard()
    @StateObject private var pacman = Pacman();
    @StateObject private var food = FoodBoard();
    @ObservedObject var stats: GameStats
    @StateObject private var blinky = Blinky();
    @StateObject private var ghostlogic = GhostLogic();
    @StateObject private var pinky = Pinky();
    @StateObject private var inky = Inky();
    @StateObject private var clyde = Clyde();
    
    var body: some View {
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        BoardView(board: board, pacman: pacman, food: food)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        PacmanView(pacman: pacman, board: board, stats: stats, food: food, ghostlogic: ghostlogic, inky: inky, pinky: pinky, blinky: blinky, clyde: clyde)
                            .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                                   height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
                            .onAppear {
                                let pacmanPosition = board.StartPoint(Row: 7, Col: 1)
                                pacman.xCoordinate = pacmanPosition.x
                                pacman.yCoordinate = pacmanPosition.y
                            }
                        GhostView(ghostlogic: ghostlogic, blinky: blinky, inky: inky, pinky: pinky, clyde: clyde, board: board, pacman: pacman, stats: stats);
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                GameStatsView(stats: stats, board: board);
            }
        }
    }
