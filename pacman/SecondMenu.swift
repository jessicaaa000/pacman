//
//  SecondMenu.swift
//  pacman
//
//  Created by Jessica Pawłowska on 25/06/2024.
//

import SwiftUI

struct SecondMenu: View {
    @StateObject private var stats = GameStats();
    @State private var isGameStarted: Bool = false;
    @State private var showError: Bool = false
    
    var body: some View {
            VStack {
                if isGameStarted {
                    ContentView(stats: stats)
                } else {
                    VStack(spacing: 50) {
                        Spacer() // Pushes the content to the center
                        
                        Text("Write your name")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        TextField("Enter your name", text: $stats.name)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 500)
                        
                        if (showError && !stats.isValidName) {
                            Text("Incorrect name. Try again")
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        } else {
                            Text("Correct name")
                        }
                    
                        
                        Button(action: {
                            if stats.isValidName {
                                isGameStarted = true
                            } else {
                              showError = true
                          }
                        }) {
                            Text("Enter")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        } // Disable button if name is empty
                        
                        Spacer() // Pushes the content to the center
                    }
                    .padding()
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            //.frame(minWidth: 1000, minHeight: 1200)
        }
}
