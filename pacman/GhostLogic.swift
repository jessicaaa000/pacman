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
    var path: [pathBackward] = [];
    
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
            for _ in 0..<board.tileSize {
                moveRight(ghost: ghost, board: board);
            }
            ghost.direction = .right
        }
    }
    
    func startTimer(ghost: Ghost, board: PacmanBoard, pacman: Pacman, stats: GameStats) {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            Task {
                await self.updateGhost(ghost: ghost, board: board, pacman: pacman, stats: stats)
            }
        }
        RunLoop.current.add(self.timer!, forMode: .common)
    }
    
    private func updateGhost(ghost: Ghost, board: PacmanBoard, pacman: Pacman, stats: GameStats) async {

        Astar(ghost: ghost, board: board, pacman:  pacman);
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            Task {
                var ghostCol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)));
                var ghostRow = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)));
                for elem in self.path{
                    if (elem.RCCoordinates == (ghostRow, ghostCol)){
                        ghost.direction = elem.direction;
                        break;
                    }
                }
                self.moveGhost(ghost: ghost, board: board)
            }
        }
        RunLoop.current.add(self.timer!, forMode: .common)

//        if ghost.direction == .up && !self.moveUp(ghost: ghost, board: board) ||
//            ghost.direction == .down && !self.moveDown(ghost: ghost, board: board) ||
//            ghost.direction == .left && !self.moveLeft(ghost: ghost, board: board) ||
//            ghost.direction == .right && !self.moveRight(ghost: ghost, board: board) {
//            let directions: [Direction] = [.left, .right, .up, .down]
//            ghost.direction = directions.randomElement()!
//        }

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
    
    func Astar(ghost: Ghost, board: PacmanBoard, pacman: Pacman) {
        var state = false;
        var startrow = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
        var startcol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
        board.gameBoard[startrow][startcol] = .otwarte;
        var distancesOpen = PriorityQueue<distance>(sort: { $0.sum < $1.sum });
        var distancesClosed: [distance] = [];
        var toPac = sqrt((pow((pacman.xCoordinate-ghost.xCoordinate), 2) + pow((pacman.yCoordinate-ghost.yCoordinate), 2)));
        var Start = distance(row: startrow, col: startcol, parentRow: startrow, parentCol: startcol, fromStart: 0, toPacman: toPac, sum: toPac);
        distancesOpen.append(Start);
        var newrow: Int = startrow
        var newcol: Int = startcol;
        
        while !distancesOpen.isEmpty{
            guard var current = distancesOpen.remove() else { break }
            newrow = current.row;
            newcol = current.col;
            if (checking_neighbours(board: board, row: newrow, col: newcol, startrow: startrow, startcol: startcol, pacman: pacman, ghost: ghost, distancesOpen: &distancesOpen, distancesClosed: distancesClosed) == true){
                state = true;
                break;
            }
            print(current);
            print(" ");
            print(distancesOpen.count);
            distancesClosed.append(current);
            board.gameBoard[current.row][current.col] = .zamkniete
        }
    }
    
    func checking_neighbours(board: PacmanBoard, row: Int, col: Int, startrow: Int, startcol: Int, pacman: Pacman, ghost: Ghost, distancesOpen: inout PriorityQueue<distance>, distancesClosed: [distance])-> Bool{
        var state = false;
        if (board.isTunnel(row: row, col: col+1) == true) {
            let(_, currentstate) = calculateDistance(row: row, col: (col+1), parentrow: row, parentcol: col, board: board, pacman: pacman, ghost: ghost, distancesOpen: &distancesOpen, distancesClosed: distancesClosed);
            state = state || currentstate;
        }
        if (board.isTunnel(row: row, col: (col-1)) == true) {
            let(_, currentstate) = calculateDistance(row: row, col: (col-1), parentrow: row, parentcol: col, board: board, pacman: pacman, ghost: ghost, distancesOpen: &distancesOpen, distancesClosed: distancesClosed);
            state = state || currentstate;
        }
        if (board.isTunnel(row: (row+1), col: col) == true) {
            let(_, currentstate) = calculateDistance(row: (row+1), col: col, parentrow: row, parentcol: col, board: board, pacman: pacman, ghost: ghost, distancesOpen: &distancesOpen, distancesClosed: distancesClosed);
            state = state || currentstate;
        }
        if (board.isTunnel(row: (row-1), col: col) == true) {
            let(_, currentstate) = calculateDistance(row: (row-1), col: col, parentrow: row, parentcol: col, board: board, pacman: pacman, ghost: ghost, distancesOpen: &distancesOpen, distancesClosed: distancesClosed);
            state = state || currentstate;
        }
        return state;
    }
    
    func calculateDistance(row: Int, col: Int, parentrow: Int, parentcol: Int, board: PacmanBoard, pacman: Pacman, ghost: Ghost, distancesOpen: inout PriorityQueue<distance>, distancesClosed: [distance]) -> (distance: distance, state: Bool)
    {
        var state = false;
        let pacRow = Int(round((pacman.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)));
        let pacCol = Int(round((pacman.xCoordinate) / CGFloat(board.tileSize)));
        if (row == pacRow && col == pacCol){
            state = true;
        }
        let startx = ghost.xCoordinate
        let starty = ghost.yCoordinate
        let x: Double = Double(col * board.tileSize + board.tileSize / 2) - 1;
        let y: Double = Double(row * board.tileSize + board.tileSize / 2);
        
        let fromStart = sqrt((pow((startx-x), 2) + pow((starty-y), 2)));
        let toPac = sqrt((pow((pacman.xCoordinate-x), 2) + pow((pacman.yCoordinate-y), 2)));
        let Node = distance(row: row, col: col, parentRow: parentrow, parentCol: parentcol, fromStart: fromStart, toPacman: toPac, sum: (fromStart+toPac));
        distancesOpen.append(Node);
        board.gameBoard[row][col] = .otwarte
        
        if state {
            print("JESTES U CELU");
            var distances: [distance] = [];
            distances.append(contentsOf: distancesOpen.allElements);
            distances.append(contentsOf: distancesClosed);
            path(node: Node, board: board, ghost: ghost, distances: distances);
        }
        
        return (Node, state);
    }
    
    func path(node: distance, board: PacmanBoard, ghost: Ghost, distances: [distance]){
        var Path: [pathBackward] = [];
        var startrow = Int(round((ghost.yCoordinate - CGFloat(board.tileSize)) / CGFloat(board.tileSize)))
        var startcol = Int(round((ghost.xCoordinate) / CGFloat(board.tileSize)))
        var pacmanPos = pathBackward(RCCoordinates: (node.row, node.col), direction: .none)
        Path.append(pacmanPos);
        board.gameBoard[node.row][node.col] = .droga;
        var currentdist = node;
        repeat{
            if (currentdist.col<currentdist.parentCol){
                var elem: pathBackward = pathBackward(RCCoordinates: (currentdist.parentRow, currentdist.parentCol), direction: .left);
                Path.append(elem);
                board.gameBoard[currentdist.parentRow][currentdist.parentCol] = .droga;
            }
            if (currentdist.col>currentdist.parentCol){
                var elem: pathBackward = pathBackward(RCCoordinates: (currentdist.parentRow, currentdist.parentCol), direction: .right);
                Path.append(elem);
                board.gameBoard[currentdist.parentRow][currentdist.parentCol] = .droga;
            }
            if (currentdist.row<currentdist.parentRow){
                var elem: pathBackward = pathBackward(RCCoordinates: (currentdist.parentRow, currentdist.parentCol), direction: .up);
                Path.append(elem);
                board.gameBoard[currentdist.parentRow][currentdist.parentCol] = .droga;
            }
            if (currentdist.row>currentdist.parentRow){
                var elem: pathBackward = pathBackward(RCCoordinates: (currentdist.parentRow, currentdist.parentCol), direction: .down);
                Path.append(elem);
                board.gameBoard[currentdist.parentRow][currentdist.parentCol] = .droga;
            }
            for elem in distances{
                if (elem.row == currentdist.parentRow && elem.col == currentdist.parentCol){
                    currentdist = elem;
                    break;
                }
            }
        } while((currentdist.col != startcol) || (currentdist.row != startrow))
        self.path = Path;
    }
}

