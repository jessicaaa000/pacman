//
//  FoodView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject var food: FoodBoard;
    @ObservedObject var board: PacmanBoard;
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<food.foodBoard.count, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<food.foodBoard[row].count, id: \.self) { col in
                        ZStack {
                            if (food.foodBoard[row][col] == .dot) {
                                DotView(dot: Dot(Row: row, Col: col))
                            }
                            else if (food.foodBoard[row][col] == .energizer){
                                EnergizerView(energizer: Energizer(Row: row, Col: col));
                            }
                            else {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: CGFloat(board.tileSize), height: CGFloat(board.tileSize))
                            }
                        }
                    }
                }
            }
        }
    }
}

