//
//  LoseView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 25/06/2024.
//

import SwiftUI

struct LoseView: View {
    @State private var restartGame = false
    @State private var showview = true
    @ObservedObject var board: PacmanBoard
    @ObservedObject var stats: GameStats
    var body: some View {
        if restartGame {
            SecondMenu()
        }
        if showview {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("YOU LOST")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("You have \(stats.score) points out of 436")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        restartGame = true
                        showview = false;
                    }) {
                        Text("RESTART")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

