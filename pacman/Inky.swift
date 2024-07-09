//
//  Inky.swift
//  pacman
//
//  Created by Jessica Pawłowska on 22/06/2024.
//

import Foundation
import Observation

@Observable
class Inky: Ghost {

    override init(img: String = "inkyprawo") {
        super.init(img: img);
    }
}
