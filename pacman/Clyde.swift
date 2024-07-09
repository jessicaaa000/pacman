//
//  Clyde.swift
//  pacman
//
//  Created by Jessica Pawłowska on 22/06/2024.
//

import Foundation
import Observation

@Observable
class Clyde: Ghost {

    override init(img: String = "clydeprawo") {
        super.init(img: img);
    }
}
