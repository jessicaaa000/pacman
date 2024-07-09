//
//  FoodBoard.swift
//  pacman
//
//  Created by Jessica Pawłowska on 20/06/2024.
//
import Foundation
import Observation

enum FoodType{
    case wall, dot, energizer, fruit, nothing
}

class FoodBoard: ObservableObject {
    let size = 32;
    @Published var foodBoard: [[FoodType]];
    
    init(){
        foodBoard = [[FoodType]](repeating: [FoodType](repeating: .wall, count: 28), count: 35)
        let downloadsURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
                let fileURL = downloadsURL.appendingPathComponent("foodboard.txt")

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
                                                    foodBoard[rowIndex][colIndex] = .wall
                                                case "1":
                                                    foodBoard[rowIndex][colIndex] = .dot
                                                case "2":
                                                    foodBoard[rowIndex][colIndex] = .energizer
                                                case "3":
                                                    foodBoard[rowIndex][colIndex] = .fruit
                                                case "4":
                                                    foodBoard[rowIndex][colIndex] = .nothing
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
    
    func EatFood(x: CGFloat, y: CGFloat, pacman: Pacman) -> FoodType {
        
        if (pacman.direction == .right){
            let row = Int(round((y - CGFloat(size)) / CGFloat(size)))
            let col = Int(round((x - 16) / CGFloat(size)))
            if row >= 0 && row < foodBoard.count && col >= 0 && col < foodBoard[row].count {
                if (foodBoard[row][col] == .dot) {
                    foodBoard[row][col] = .nothing;
                    return .dot;
                }
                if (foodBoard[row][col] == .energizer) {
                    foodBoard[row][col] = .nothing;
                    return .energizer;
                }
            }
        }
        if (pacman.direction == .up){
            let row = Int(round((y - CGFloat(size) + 16) / CGFloat(size)))
            let col = Int(round((x) / CGFloat(size)))
            if row >= 0 && row < foodBoard.count && col >= 0 && col < foodBoard[row].count {
                if (foodBoard[row][col] == .dot) {
                    foodBoard[row][col] = .nothing;
                    return .dot;
                }
                else if (foodBoard[row][col] == .energizer) {
                    foodBoard[row][col] = .nothing;
                    return .energizer;
                }
            }
        }
        if (pacman.direction == .down){
            let row = Int(round((y - CGFloat(size) - 10) / CGFloat(size)))
            let col = Int(round((x) / CGFloat(size)))
            if row >= 0 && row < foodBoard.count && col >= 0 && col < foodBoard[row].count {
                if (foodBoard[row][col] == .dot) {
                    foodBoard[row][col] = .nothing;
                    return .dot;
                }
                else if (foodBoard[row][col] == .energizer) {
                    foodBoard[row][col] = .nothing;
                    return .energizer;
                }
            }
        }
        if (pacman.direction == .left){
            let row = Int(round((y - CGFloat(size)) / CGFloat(size)))
            let col = Int(round((x + 10) / CGFloat(size)))
            if row >= 0 && row < foodBoard.count && col >= 0 && col < foodBoard[row].count {
                if (foodBoard[row][col] == .dot) {
                    foodBoard[row][col] = .nothing;
                    return .dot;
                }
                if (foodBoard[row][col] == .energizer) {
                    foodBoard[row][col] = .nothing;
                    return .energizer;
                }
            }
        }
        return .nothing
    }
}
