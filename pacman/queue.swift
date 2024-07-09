//
//  queue.swift
//  pacman
//
//  Created by Jessica Pawłowska on 24/06/2024.
//

import Foundation

struct Queue<T: Equatable> {
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) { //dodaje element do kolejki
        elements.append(element)
    }
    
    mutating func dequeue() -> T? { //usuwa pierwszy element z kolejki i go zwraca
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    func isEmpty() -> Bool { //zwraca, czy kolejka jest pusta
        return elements.isEmpty
    }
    
    func peek() -> T? { //zwraca pierwszy element kolejki bez usuwania go
        return elements.first
    }
    
    func count() -> Int {
        return elements.count
    }
    
    mutating func clear() { // zeruje kolejkę
        elements.removeAll()
    }
    
    func find(_ element: T) -> T? { // sprawdza, czy element znajduje się w kolejce i go zwraca
        return elements.first(where: { $0 == element })
    }
    
}
