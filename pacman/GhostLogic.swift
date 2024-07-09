//
//  GhostLogic.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import Observation
import Foundation


struct Elem: Equatable {
    var Row: Int
    var Col: Int
    var direction: Direction
}

@Observable
class GhostLogic : ObservableObject {
    var moveInMemory: Bool = false;
    let speed: Double = 0.015;
    let step: Double = 1.0;
    var timer: Timer? = nil
    var directionNum: Int = 0;
    
    func Teleportation(ghost: Ghost, board: PacmanBoard){
        let row = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
        let col = Int(round((ghost.xCoordinate-1) / CGFloat(board.tileSize)))
        if(col == 0){
            (ghost.xCoordinate, ghost.yCoordinate) = board.StartPoint(Row: row, Col: 27);
            for _ in 0..<board.tileSize {
                moveLeft(ghost: ghost, board: board);
            }
            ghost.direction = .left;
        }
        if(col == 27){
            for _ in 0..<board.tileSize-1 {
                moveRight(ghost: ghost, board: board);
            }
            (ghost.xCoordinate, ghost.yCoordinate) = board.StartPoint(Row: row, Col: 1);
            for i in 0..<board.tileSize {
                moveRight(ghost: ghost, board: board);
            }
            ghost.direction = .right
        }
    }
    
    func startTimer(ghost: Ghost, board: PacmanBoard, pacman: Pacman, stats: GameStats) {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            Task {
                await self.updateGhost(ghost: ghost, board: board, pacman: pacman, stats: stats)
            }
        }
        RunLoop.current.add(self.timer!, forMode: .common)
    }
    
    private func updateGhost(ghost: Ghost, board: PacmanBoard, pacman: Pacman, stats: GameStats) async {
        if self.moveInMemory {
            if ghost.nextDirection == .up && self.moveUp(ghost: ghost, board: board) {
                ghost.direction = ghost.nextDirection
            } else if ghost.nextDirection == .right && self.moveRight(ghost: ghost, board: board) {
                ghost.direction = ghost.nextDirection
            } else if ghost.nextDirection == .left && self.moveLeft(ghost: ghost, board: board) {
                ghost.direction = ghost.nextDirection
            } else if ghost.nextDirection == .down && self.moveDown(ghost: ghost, board: board) {
                ghost.direction = ghost.nextDirection
            }
        }

        self.moveGhost(ghost: ghost, board: board)

        if ghost.direction == .up && !self.moveUp(ghost: ghost, board: board) ||
            ghost.direction == .down && !self.moveDown(ghost: ghost, board: board) ||
            ghost.direction == .left && !self.moveLeft(ghost: ghost, board: board) ||
            ghost.direction == .right && !self.moveRight(ghost: ghost, board: board) {
            let directions: [Direction] = [.left, .right, .up, .down]
            ghost.direction = directions.randomElement()!
        }

        await self.Collision(pacman: pacman, ghost: ghost, stats: stats, board: board)
    }

    func Collision(pacman: Pacman, ghost: Ghost, stats: GameStats, board: PacmanBoard) async {
        let pacCol = Int(round((pacman.xCoordinate) / CGFloat(board.tileSize)))
        let pacRow = Int(round((pacman.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
        let ghostCol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
        let ghostRow = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
        if !ghost.ifVulnerable && pacCol == ghostCol && ghostRow == pacRow {
            stats.lives -= 1
            let pacmanPosition = board.StartPoint(Row: 7, Col: 1)
            pacman.xCoordinate = pacmanPosition.x
            pacman.yCoordinate = pacmanPosition.y
            if stats.lives == 0 {
                stats.lose = true
            }
        }
    }
    
    
    func moveGhost(ghost: Ghost, board: PacmanBoard){
        Teleportation(ghost: ghost, board: board);
        switch ghost.direction {
        case .left: moveLeft(ghost: ghost, board: board);
        case .right: moveRight(
            ghost: ghost, board: board);
        case .up: moveUp(ghost: ghost, board: board);
        case .down: moveDown(ghost: ghost, board: board);
        case .none: return;
        }
    }
    
    func moveLeft(ghost: Ghost, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(ghost.xCoordinate-Double(board.tileSize)), y: CGFloat(ghost.yCoordinate)) && board.isTunnel(x: CGFloat(ghost.xCoordinate-Double(board.tileSize)), y: CGFloat(ghost.yCoordinate + Double(board.tileSize-1))) {
            
            if ghost.ifVulnerable == false {
                if let blinky = ghost as? Blinky {
                    blinky.image = "blinkylewo"
                } else if let inky = ghost as? Inky {
                    inky.image = "inkylewo"
                } else if let clyde = ghost as? Clyde {
                    clyde.image = "clydelewo"
                } else if let pinky = ghost as? Pinky {
                    pinky.image = "pinkylewo"
                }
            }
            
            ghost.xCoordinate -= step;
            return true;
        }
        else {
            return false;
        }
    }
    
    func moveRight(ghost: Ghost, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(ghost.xCoordinate+1), y: CGFloat(ghost.yCoordinate)) &&  board.isTunnel(x: CGFloat(ghost.xCoordinate+1), y: CGFloat(ghost.yCoordinate + Double(board.tileSize-1))) {
            ghost.xCoordinate += step;
            
            if ghost.ifVulnerable == false {
                if let blinky = ghost as? Blinky {
                    blinky.image = "blinkyprawo"
                } else if let inky = ghost as? Inky {
                    inky.image = "inkyprawo"
                } else if let clyde = ghost as? Clyde {
                    clyde.image = "clydeprawo"
                } else if let pinky = ghost as? Pinky {
                    pinky.image = "pinkyprawo"
                }
            }
            
            return true;
        }
        else {
            return false;
        }
    }
    
    
    func moveDown(ghost: Ghost, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(ghost.xCoordinate), y: CGFloat(ghost.yCoordinate+Double(board.tileSize))) && board.isTunnel(x: CGFloat(ghost.xCoordinate-Double(board.tileSize-1)), y: CGFloat(ghost.yCoordinate+Double(board.tileSize))) {
            
            if ghost.ifVulnerable == false {
                if let blinky = ghost as? Blinky {
                    blinky.image = "blinkydol"
                } else if let inky = ghost as? Inky {
                    inky.image = "inkydol"
                } else if let clyde = ghost as? Clyde {
                    clyde.image = "clydedol"
                } else if let pinky = ghost as? Pinky {
                    pinky.image = "pinkydol"
                }
            }
            
            ghost.yCoordinate += step;
            return true;
        }
        else {
            return false;
        }
    }
    
    
    func moveUp(ghost: Ghost, board: PacmanBoard) -> Bool
    {
        if board.isTunnel(x: CGFloat(ghost.xCoordinate), y: CGFloat(ghost.yCoordinate-1)) && board.isTunnel(x: CGFloat(ghost.xCoordinate - Double(board.tileSize-1)), y: CGFloat(ghost.yCoordinate-1)) {
            
            if ghost.ifVulnerable == false {
                if let blinky = ghost as? Blinky {
                    blinky.image = "blinkygora"
                } else if let inky = ghost as? Inky {
                    inky.image = "inkygora"
                } else if let clyde = ghost as? Clyde {
                    clyde.image = "clydegora"
                } else if let pinky = ghost as? Pinky {
                    pinky.image = "pinkygora"
                }
            }
            
            ghost.yCoordinate -= step;
            return true;
        }
        else {
            return false;
        }
    }
    
    func makeVulnerable(ghost: Ghost) {
        ghost.ifVulnerable = true
        ghost.image = "vulnerableghoast"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            ghost.ifVulnerable = false
            if let blinky = ghost as? Blinky {
                switch ghost.direction {
                case .left: blinky.image = "blinkylewo"
                case .right: blinky.image = "blinkyprawo"
                case .up: blinky.image = "blinkygora"
                case .down: blinky.image = "blinkydol"
                case .none: return;
                }
            } else if let inky = ghost as? Inky {
                switch ghost.direction {
                case .left: inky.image = "inkylewo"
                case .right: inky.image = "inkyprawo"
                case .up: inky.image = "inkygora"
                case .down: inky.image = "inkydol"
                case .none: return;
                }
            } else if let clyde = ghost as? Clyde {
                switch ghost.direction {
                case .left: clyde.image = "clydelewo"
                case .right: clyde.image = "clydeprawo"
                case .up: clyde.image = "clydegora"
                case .down: clyde.image = "clydedol"
                case .none: return;
                }
            } else if let pinky = ghost as? Pinky {
                switch ghost.direction {
                case .left: pinky.image = "pinkylewo"
                case .right: pinky.image = "pinkyprawo"
                case .up: pinky.image = "pinkygora"
                case .down: pinky.image = "pinkydol"
                case .none: return;
                }
            }
        }
    }
    
//    func FastWaytoPac(pacman: Pacman, board: PacmanBoard, ghost: Ghost){
//        var visitedArray: [[Bool]] = Array(repeating: Array(repeating: false, count: 33), count: 33)
//        var row = 33
//        var col = 33
//        for row in 0..<row {
//            for col in 0..<col {
//                visitedArray[row][col] = false
//            }
//        }
//        let PacRow = Int(round((pacman.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
//        let PacCol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
//        let Ghostrow = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
//        let Ghostcol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
//        var Queue = Queue<Elem>()
//        var FirstCoor = Elem(Row: Ghostrow, Col: Ghostcol, direction: ghost.direction)
//        Queue.enqueue(FirstCoor)
//        while Queue.isEmpty() == false {
//            var eelem: Elem = Queue.dequeue()!
//            visitedArray[Ghostrow][Ghostcol] = true;
//            if (eelem.Col == PacCol && eelem.Row == PacRow){
//                //MakeRoad(ghost: ghost, queue: &Queue, board: board);
//                break;
//            }
//            if ((board.isTunnel(row: (eelem.Row - 1), col: eelem.Col) == true) && visitedArray[(eelem.Row - 1)][eelem.Col] == false) {
//                var Coor = Elem(Row: (eelem.Row - 1), Col: eelem.Col, direction: .left)
//                Queue.enqueue(Coor)
//                visitedArray[eelem.Row - 1][eelem.Col] = true;
//            }
//            if ((board.isTunnel(row: (eelem.Row + 1), col: eelem.Col) == true) && visitedArray[(eelem.Row + 1)][eelem.Col] == false) {
//                var Coor = Elem(Row: (eelem.Row + 1), Col: eelem.Col, direction: .right)
//                Queue.enqueue(Coor)
//                visitedArray[eelem.Row + 1][eelem.Col] = true;
//            }
//            if ((board.isTunnel(row: eelem.Row, col: (eelem.Col - 1)) == true) && visitedArray[(eelem.Row)][eelem.Col - 1] == false) {
//                var Coor = Elem(Row: eelem.Row, Col: (eelem.Col - 1), direction: .up)
//                Queue.enqueue(Coor)
//                visitedArray[eelem.Row][eelem.Col - 1] = true;
//            }
//            if ((board.isTunnel(row: eelem.Row, col: (eelem.Col + 1)) == true) && visitedArray[(eelem.Row)][eelem.Col + 1] == false) {
//                var Coor = Elem(Row: eelem.Row, Col: (eelem.Col + 1), direction: .down)
//                Queue.enqueue(Coor)
//                visitedArray[eelem.Row][eelem.Col + 1] = true;
//            }
//        }
//    }
    
//    func MazeSolver (pacman: Pacman, board: PacmanBoard, ghost: Ghost) {
//        var wall: [[Bool]] = Array(repeating: Array(repeating: false, count: 35), count: 28)
//        for row in 0..<26{
//            for col in 0..<26{
//                if (board.gameBoard[row][col] == .wall){
//                    wall[row][col] = true;
//                }
//            }
//            print()
//        }
//        var wasHere: [[Bool]] = Array(repeating: Array(repeating: false, count: 35), count: 28)
//        var correctPath: [[Bool]] = Array(repeating: Array(repeating: false, count: 35), count: 28)
//        var startRow = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
//        var startCol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
//        var endCol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
//        var endRow = Int(round((pacman.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
//        recursiveSolve(startrow: startRow, startcol: startCol, endrow: endRow, endcol: endCol, wall: &wall, wasHere: &wasHere, correctPath: &correctPath)
//        for row in 0..<28{
//            for col in 0..<35{
//                print(correctPath[row][col])
//            }
//            print()
//        }
//    }
    
//    func recursiveSolve(startrow: Int, startcol: Int, endrow: Int, endcol: Int, wall: inout [[Bool]], wasHere: inout [[Bool]], correctPath: inout [[Bool]]) -> Bool {
//            if startrow == endrow && startcol == endcol { return true } // If you reached the end
//            if wall[startrow][startcol] || wasHere[startrow][startcol] { return false } // If you are on a wall or already were here
//            wasHere[startrow][startcol] = true
//
//            if startrow != 0 { // Checks if not on left edge
//                if recursiveSolve(startrow: startrow - 1, startcol: startcol, endrow: endrow, endcol: endcol, wall: &wall, wasHere: &wasHere, correctPath: &correctPath) { // Recalls method one to the left
//                    correctPath[startrow-1][startcol] = true // Sets that path value to true
//                    return true
//                }
//            }
//            if startrow != 27 { // Checks if not on right edge
//                if recursiveSolve(startrow: startrow + 1, startcol: startcol, endrow: endrow, endcol: endcol, wall: &wall, wasHere: &wasHere, correctPath: &correctPath) { // Recalls method one to the right
//                    correctPath[startrow+1][startcol] = true
//                    return true
//                }
//            }
//            if startcol != 0 { // Checks if not on top edge
//                if recursiveSolve(startrow: startrow, startcol: startcol - 1, endrow: endrow, endcol: endcol, wall: &wall, wasHere: &wasHere, correctPath: &correctPath) { // Recalls method one up
//                    correctPath[startrow][startcol-1] = true
//                    return true
//                }
//            }
//            if startcol != 34 { // Checks if not on bottom edge
//                if recursiveSolve(startrow: startrow, startcol: startcol + 1, endrow: endrow, endcol: endcol, wall: &wall, wasHere: &wasHere, correctPath: &correctPath) { // Recalls method one down
//                    correctPath[startrow][startcol+1] = true
//                    return true
//                }
//            }
//            return false
//        }
    
}

