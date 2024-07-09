//
//  Pinky.swift
//  pacman
//
//  Created by Jessica Pawłowska on 22/06/2024.
//

import Foundation
import Observation

@Observable
class Pinky: Ghost {

    override init(img: String = "pinkyprawo") {
        super.init(img: img);
    }
}
