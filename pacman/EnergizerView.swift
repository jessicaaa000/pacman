//
//  EnergizerView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import SwiftUI

struct EnergizerView: View {
    var energizer: Energizer;
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(width: 32, height: 32)
            Image(energizer.image)
                .resizable()
                .frame(width: 20, height: 20)
                .position(x: 16, y: 16)
        }
    }
}
