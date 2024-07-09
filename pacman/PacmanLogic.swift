//
//  PacmanLogic.swift
//  pacman
//
//  Created by Jessica Pawłowska on 18/06/2024.
//

import Observation
import Foundation

@Observable
class PacmanLogic : ObservableObject {
    var moveInMemory: Bool = false;
    let speed: Double = 0.01;
    let step: Double = 1.0;
    var timer: Timer? = nil
    
    func Teleportation(pacman: Pacman, board: PacmanBoard){
        let row = Int(round((pacman.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
        let col = Int(round((pacman.xCoordinate-1) / CGFloat(board.tileSize)))
        if(col == 0){
            (pacman.xCoordinate, pacman.yCoordinate) = board.StartPoint(Row: row, Col: 27);
            for _ in 0..<board.tileSize {
                moveLeft(pacman: pacman, board: board);
            }
            pacman.direction = .left;
        }
        if(col == 27){
            for _ in 0..<board.tileSize-1 {
                moveRight(pacman: pacman, board: board);
            }
            (pacman.xCoordinate, pacman.yCoordinate) = board.StartPoint(Row: row, Col: 1);
            for i in 0..<board.tileSize {
                moveRight(pacman: pacman, board: board);
            }
            pacman.direction = .right
        }
    }
    
    func startTimer(pacman: Pacman, board: PacmanBoard, food: FoodBoard, stats: GameStats, ghostlogic: GhostLogic, inky: Inky, blinky: Blinky, clyde: Clyde, pinky: Pinky) {
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { _ in
            if self.moveInMemory == true {
                if (pacman.nextDirection == .up && self.moveUp(pacman: pacman, board: board) == true) {
                    pacman.direction = pacman.nextDirection;
                }
                if (pacman.nextDirection == .right && self.moveRight(pacman: pacman, board: board) == true) {
                    pacman.direction = pacman.nextDirection;
                }
                if (pacman.nextDirection == .left && self.moveLeft(pacman: pacman, board: board) == true) {
                    pacman.direction = pacman.nextDirection;
                }
                if (pacman.nextDirection == .down && self.moveDown(pacman: pacman, board: board) == true) {
                    pacman.direction = pacman.nextDirection;
                }
            }
            self.movePacman(pacman: pacman, board: board)
            self.EatOrGo(food: food, pacman: pacman, stats: stats, ghostlogic: ghostlogic, inky: inky, blinky: blinky, clyde: clyde, pinky: pinky)
            
        }}
    
    func EatOrGo(food: FoodBoard, pacman: Pacman, stats: GameStats, ghostlogic: GhostLogic, inky: Inky, blinky: Blinky, clyde: Clyde, pinky: Pinky){
        switch (food.EatFood(x:pacman.xCoordinate , y: pacman.yCoordinate, pacman: pacman)) {
        case .dot: stats.score += 1;
        case .energizer:
            stats.score += 50;
            ghostlogic.makeVulnerable(ghost: inky)
            ghostlogic.makeVulnerable(ghost: pinky)
            ghostlogic.makeVulnerable(ghost: blinky)
            ghostlogic.makeVulnerable(ghost: clyde)
        case .nothing: stats.score += 0;
        case .wall: stats.score += 0;
        case .fruit: stats.score += 0;
        }
    }
    
    func movePacman(pacman: Pacman, board: PacmanBoard){
        Teleportation(pacman: pacman, board: board);
        switch pacman.direction {
        case .left: moveLeft(pacman: pacman, board: board);
        case .right: moveRight(
            pacman: pacman, board: board);
        case .up: moveUp(pacman: pacman, board: board);
        case .down: moveDown(pacman: pacman, board: board);
        case .none: return;
        }
    }
    
    func moveLeft(pacman: Pacman, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(pacman.xCoordinate-Double(board.tileSize)), y: CGFloat(pacman.yCoordinate)) && board.isTunnel(x: CGFloat(pacman.xCoordinate-Double(board.tileSize)), y: CGFloat(pacman.yCoordinate + Double(board.tileSize-1))) {
            if (pacman.nextDirection == .left && moveInMemory == true) {
                moveInMemory = false;
            }
            if(pacman.imgCounter<12){
                pacman.imgCounter+=1;
                switch pacman.imgCounter{
                case 1 ... 3: pacman.image = "pacmanlewo1";
                case 4 ... 6: pacman.image = "pacmanlewo2";
                case 7 ... 9: pacman.image = "pacmanlewo3";
                case 10 ... 12: pacman.image = "pacmanlewo4";
                default:
                    pacman.image = "pacman";
                }
            }
            else {
                pacman.imgCounter = 0;
                pacman.image = "pacman";
            }
            pacman.xCoordinate -= step;
            if (moveInMemory == true && pacman.nextDirection == .left){
                moveInMemory = false;
            }
            return true;
            }
        else {
                moveInMemory = true;
                pacman.nextDirection = .left;
            return false;
        }
    }
    
    func moveRight(pacman: Pacman, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(pacman.xCoordinate+1), y: CGFloat(pacman.yCoordinate)) &&  board.isTunnel(x: CGFloat(pacman.xCoordinate+1), y: CGFloat(pacman.yCoordinate + Double(board.tileSize-1))) {
            if(pacman.imgCounter<12){
                if (pacman.nextDirection == .right && moveInMemory == true) {
                    moveInMemory = false;
                }
                pacman.imgCounter+=1;
                switch pacman.imgCounter{
                case 1 ... 3: pacman.image = "pacmanprawo1";
                case 4 ... 6: pacman.image = "pacmanprawo2";
                case 7 ... 9: pacman.image = "pacmanprawo3";
                case 10 ... 12: pacman.image = "pacmanprawo4";
                default:
                    pacman.image = "pacman";
                }
            }
            else {
                pacman.imgCounter = 0;
                pacman.image = "pacman";
            }
            pacman.xCoordinate += step;
            if (moveInMemory == true && pacman.nextDirection == .right){
                moveInMemory = false;
            }
            return true;
        }
        else {
                moveInMemory = true;
                pacman.nextDirection = .right;
        return false;
        }
    }
    
    
    func moveDown(pacman: Pacman, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(pacman.xCoordinate), y: CGFloat(pacman.yCoordinate+Double(board.tileSize))) && board.isTunnel(x: CGFloat(pacman.xCoordinate-Double(board.tileSize-1)), y: CGFloat(pacman.yCoordinate+Double(board.tileSize))) {
            if (pacman.nextDirection == .down && moveInMemory == true) {
                moveInMemory = false;
            }
            if(pacman.imgCounter<12){
                pacman.imgCounter+=1;
                switch pacman.imgCounter{
                case 1 ... 3: pacman.image = "pacmandol1";
                case 4 ... 6: pacman.image = "pacmandol2";
                case 7 ... 9: pacman.image = "pacmandol3";
                case 10 ... 12: pacman.image = "pacmandol4";
                default:
                    pacman.image = "pacman";
                }
                
            }
            else {
                pacman.imgCounter = 0;
                pacman.image = "pacman";
            }
            pacman.yCoordinate += step;
            if (moveInMemory == true && pacman.nextDirection == .down){
                moveInMemory = false;
            }
            return true;
        }
        else {
                moveInMemory = true;
                pacman.nextDirection = .down;
            return false;
        }
    }

    
    func moveUp(pacman: Pacman, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(pacman.xCoordinate), y: CGFloat(pacman.yCoordinate-1)) && board.isTunnel(x: CGFloat(pacman.xCoordinate - Double(board.tileSize-1)), y: CGFloat(pacman.yCoordinate-1)) {
            if (pacman.nextDirection == .up && moveInMemory == true) {
                moveInMemory = false;
            }
            if(pacman.imgCounter<12){
                pacman.imgCounter+=1;
                switch pacman.imgCounter{
                case 1 ... 3: pacman.image = "pacmangora1";
                case 4 ... 6: pacman.image = "pacmangora2";
                case 7 ... 9: pacman.image = "pacmangora3";
                case 10 ... 12: pacman.image = "pacmangora4";
                default:
                    pacman.image = "pacman";
                }
                
            }
            else {
                pacman.imgCounter = 0;
                pacman.image = "pacman";
            }
            pacman.yCoordinate -= step;
            if (moveInMemory == true && pacman.nextDirection == .up){
                moveInMemory = false;
            }
            return true;
        }
        else {
                moveInMemory = true;
                pacman.nextDirection = .up;
            return false;
        }
    }
    
}
