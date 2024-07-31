//
//  GhostView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import SwiftUI

struct GhostView: View {
    @ObservedObject var ghostlogic: GhostLogic;
    @ObservedObject var blinky: Blinky;
    @ObservedObject var inky: Inky;
    @ObservedObject var pinky: Pinky;
    @ObservedObject var clyde: Clyde;
    @ObservedObject var board: PacmanBoard
    @ObservedObject var pacman: Pacman
    @ObservedObject var stats: GameStats
    
    var body: some View {
        BlinkyView(blinky: blinky, board: board, ghostlogic: ghostlogic, pacman: pacman, stats: stats)
            .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                   height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
            .onAppear {
                let blinkyPosition = board.StartPoint(Row: 14, Col: 12)
                blinky.xCoordinate = blinkyPosition.x
                blinky.yCoordinate = blinkyPosition.y
            }
        InkyView(inky: inky, board: board, ghostlogic: ghostlogic, pacman: pacman, stats: stats)
            .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                   height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
            .onAppear {
                let inkyPosition = board.StartPoint(Row: 14, Col: 14)
                inky.xCoordinate = inkyPosition.x
                inky.yCoordinate = inkyPosition.y
            }
        PinkyView(pinky: pinky, board: board, ghostlogic: ghostlogic, pacman: pacman, stats: stats)
            .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                   height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
            .onAppear {
                let pinkyPosition = board.StartPoint(Row: 14, Col: 15)
                pinky.xCoordinate = pinkyPosition.x
                pinky.yCoordinate = pinkyPosition.y
            }
        ClydeView(clyde: clyde, board: board, ghostlogic: ghostlogic, pacman: pacman, stats: stats)
            .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                   height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
            .onAppear {
                let clydePosition = board.StartPoint(Row: 14, Col: 16)
                clyde.xCoordinate = clydePosition.x
                clyde.yCoordinate = clydePosition.y
            }
    }
}
