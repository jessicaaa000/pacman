//
//  priorityQueue.swift
//  pacman
//
//  Created by Jessica Pawłowska on 01/08/2024.
//

import Foundation

struct PriorityQueue<T> {
    private var elements: [T]
    private let priorityFunction: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.elements = []
        self.priorityFunction = sort
    }

    mutating func append(_ element: T) {
        elements.append(element)
        elements.sort(by: priorityFunction)
    }

    mutating func remove() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }

    func first() -> T? {
        return elements.first
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }
    
    var allElements: [T] {
        return elements
    }
}
