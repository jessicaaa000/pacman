//
//  FirstMenu.swift
//  pacman
//
//  Created by Jessica Pawłowska on 25/06/2024.
//

import SwiftUI

struct FirstMenu: View {
    @State private var startGame = false

    var body: some View {
        VStack {
            if startGame {
                SecondMenu()
            } else {
                VStack(spacing: 50) {
                    Spacer() // Pushes the content to the center

                    Text("Pacman")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Button(action: {
                        startGame = true
                    }) {
                        Text("Start Game")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Spacer()
                }
                .padding()
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}
