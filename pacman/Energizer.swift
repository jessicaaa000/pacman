//
//  Energizer.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import Foundation
import Observation

@Observable
class Energizer: ObservableObject{
    let image: String = "kropka";
    var xCoordinate: Double;
    var yCoordinate: Double;
    let size: Int = 32;
    
    init(Row: Int, Col: Int) {
        let row = Row
        let col = Col

        // Calculate the x and y coordinates
        xCoordinate = Double(col * size + size / 2)
        yCoordinate = Double(row * size + size / 2)
    }
}

