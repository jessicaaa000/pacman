//
//  distance.swift
//  pacman
//
//  Created by Jessica Pawłowska on 27/07/2024.
//

import Foundation

struct distance: Equatable {
    var row: Int;
    var col: Int;
    var parentRow: Int;
    var parentCol: Int;
    var fromStart: Double;
    var toPacman: Double;
    var sum: Double;
    
    static func == (lhs: distance, rhs: distance) -> Bool {
            return lhs.row == rhs.row &&
                   lhs.col == rhs.col &&
                   lhs.parentRow == rhs.parentRow &&
                   lhs.parentCol == rhs.parentCol &&
                   lhs.fromStart == rhs.fromStart &&
                   lhs.toPacman == rhs.toPacman &&
                   lhs.sum == rhs.sum
    }
}
