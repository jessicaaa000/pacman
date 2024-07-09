//
//  GameStatsView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import SwiftUI

struct GameStatsView: View {
    @ObservedObject var stats: GameStats;
    @ObservedObject var board: PacmanBoard;
    
    var body: some View {
        VStack{
            if (board.showBoard == true){
                Text("Aktualna liczba punktów: \(stats.score)")
                Text("Ilość żyć: \(stats.lives)")
                Text("Nazwa: \(stats.name)")}
            if (stats.lives <= 0){
                LoseView(board: board, stats: stats)
                    .onAppear {
                        board.showBoard = false
                    }
            }
            if stats.score == 436 {
                WinView(board: board, stats: stats)
                    .onAppear {
                        board.showBoard = false
                    }
            }
        }
    }
}
