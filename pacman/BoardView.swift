//
//  BoardView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var board: PacmanBoard
    @ObservedObject var pacman: Pacman
    @ObservedObject var food: FoodBoard;
    
    var body: some View {
        if (board.showBoard == true) {
            VStack {
                ZStack {
                    VStack(spacing: 0) {
                        ForEach(0..<board.gameBoard.count, id: \.self) { row in
                            HStack(spacing: 0) {
                                ForEach(0..<board.gameBoard[row].count, id: \.self) { col in
                                    Rectangle()
                                        .fill(colorForTileType(board.gameBoard[row][col]))
                                        .frame(width: CGFloat(board.tileSize), height: CGFloat(board.tileSize))
                                }
                            }
                        }
                    }
                    .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                           height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
                    
                    FoodView(food: food, board: board)
                        .frame(width: CGFloat(board.tileSize) * CGFloat(board.gameBoard[0].count),
                               height: CGFloat(board.tileSize) * CGFloat(board.gameBoard.count))
                }
            }
        }
        }
    
    func colorForTileType(_ tileType: BoardType) -> Color {
        switch tileType {
        case .wall:
            return Color(red: 0, green: 0, blue: 1)
        case .tunnel:
            return Color(red: 0, green: 0, blue: 0.545)
        case .otwarte:
            return Color(red: 0, green: 1, blue: 0)
        case .zamkniete:
            return Color(red: 1, green: 0, blue: 0)
        case .droga:
            return Color(red: 0.6, green: 0.3, blue: 0.2)
        }
    }
}


