//
//  Blinky.swift
//  pacman
//
//  Created by Jessica Pawłowska on 22/06/2024.
//

import Foundation
import Observation

@Observable
class Blinky: Ghost {

    override init(img: String = "blinkyprawo") {
        super.init(img: img);
    }
}
