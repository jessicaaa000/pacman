//
//  objects.swift
//  pacman
//
//  Created by Jessica Pawłowska on 04/06/2024.
//

import Foundation
import Observation


@Observable
class Pacman: ObservableObject {
    var imgCounter: Int;
    var image: String;
    var direction: Direction
    var nextDirection: Direction
    var xCoordinate: Double
    var yCoordinate: Double

    init() {
        direction = .none
        xCoordinate = 100
        yCoordinate = 300
        imgCounter = 0;
        image = "pacman";
        nextDirection = .none;
    }
}

