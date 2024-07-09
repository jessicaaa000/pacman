//
//  Ghost.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import Foundation
import Observation

@Observable
class Ghost: ObservableObject {
    var direction: Direction
    var xCoordinate: Double
    var yCoordinate: Double
    //var MoveQueue: Queue<Direction>
    var nextDirection: Direction
    var ifVulnerable: Bool = false;
    var image: String
    //let initialImage: String
    
    init(img: String) {
        direction = .right
        xCoordinate = 100
        yCoordinate = 300
        //MoveQueue = Queue<Direction>()
        nextDirection = .none
        self.image = img;
        //self.initialImage = image
    }
}
