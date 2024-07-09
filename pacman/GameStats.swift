//
//  GameStats.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//

import Foundation
import Observation


@Observable
class GameStats: ObservableObject{
    var score: Int;
    var lives: Int;
    var lose: Bool;
    var name: String;
    
    init(){
        score = 0;
        lives = 3;
        lose = false;
        name = "";
    }
    
    var isValidName: Bool {
        let pattern = "^[a-zA-Z]+(?:\\s[a-zA-Z]+)*$"
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: name.utf16.count)
        return regex?.firstMatch(in: name, options: [], range: range) != nil
    }
    
    
}
