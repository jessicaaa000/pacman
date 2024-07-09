//
//  DotView.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import SwiftUI

struct DotView: View {
    var dot: Dot;
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(width: 32, height: 32)
            Image(dot.image)
                .resizable()
                .frame(width: 8, height: 8)
                .position(x: 16, y: 16) // umieszczamy kropkę na środku przezroczystego kwadratu
        }
    }
}
