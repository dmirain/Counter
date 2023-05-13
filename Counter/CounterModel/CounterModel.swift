//
//  CounterModel.swift
//  Counter
//
//  Created by Dmitry Prokofyev on 13.05.2023.
//

import Foundation

struct CounterModel {
    private(set) var state = 0
    private(set) var history: [Action] = []

    mutating func increase() {
        addAction(.increased)
        state += 1
    }

    mutating func decrease() {
        guard state > 0 else {
            addAction(.zeroError)
            return
        }
        addAction(.decreased)
        state -= 1
    }

    mutating func reset() {
        addAction(.reset)
        state = 0
    }
    
    func historyAsText() -> String {
        return history
            .reversed()
            .map { action in action.asText() }
            .joined(separator: "\n")
    }
    
    private mutating func addAction(_ actionType: ActionType) {
        history.append(
            Action(stateBefor: state, actionType: actionType)
        )
    }
}
