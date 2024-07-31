//
//  pacmanBoard.swift
//  pacman
//
//  Created by Jessica Pawłowska on 04/06/2024.
//
import Observation
import Foundation
enum BoardType { case 
    wall, tunnel, otwarte, zamkniete, droga }

@Observable
class PacmanBoard: ObservableObject {
    let tileSize: Int;
    public var gameBoard: [[BoardType]]
    var showBoard: Bool = true

    
    init() {
        tileSize = 32
        gameBoard = [[BoardType]](repeating: [BoardType](repeating: .wall, count: 28), count: 35)
        let downloadsURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
                let fileURL = downloadsURL.appendingPathComponent("board.txt")

                do {
                    let text = try String(contentsOf: fileURL, encoding: .utf8)
                    let lines = text.components(separatedBy: "\n")
                    for (rowIndex, line) in lines.enumerated() {
                                    if rowIndex < 35 { // Upewnienie się, że nie wyjdziemy poza zakres gameBoard
                                        let characters = Array(line)
                                        for (colIndex, char) in characters.enumerated() {
                                            if colIndex < 28 { // Upewnienie się, że nie wyjdziemy poza zakres gameBoard
                                                switch char {
                                                case "0":
                                                    gameBoard[rowIndex][colIndex] = .wall
                                                case "1":
                                                    gameBoard[rowIndex][colIndex] = .tunnel
                                                default:
                                                    break
                                                }
                                            }
                                        }
                                    }
                                }
                            } catch {
                                print("Error reading file: \(error.localizedDescription)")
                            }
    }

    func StartPoint(Row: Int, Col: Int) -> (x: Double, y: Double) {
        let row = Row
        let col = Col

        // Calculate the x and y coordinates
        let x: Double = Double(col * tileSize + tileSize / 2) - 1;
        let y: Double = Double(row * tileSize + tileSize / 2)

        return (x, y)
    }

    func isTunnel(x: CGFloat, y: CGFloat) -> Bool {
        let row = Int(round((y - CGFloat(tileSize)) / CGFloat(tileSize)))
        let col = Int(round((x) / CGFloat(tileSize)))

        // Check bounds
        if row >= 0 && row < gameBoard.count && col >= 0 && col < gameBoard[row].count {
            if gameBoard[row][col] == .tunnel {
                return true
            }
        }
        return false
    }
    
    func isTunnel(row: Int, col: Int) -> Bool {
        if row >= 0 && row < gameBoard.count && col >= 0 && col < gameBoard[row].count {
            if gameBoard[row][col] == .tunnel {
                return true
            }
        }
        return false
    }
    
}
