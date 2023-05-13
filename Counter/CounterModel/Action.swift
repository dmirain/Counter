//
//  Action.swift
//  Counter
//
//  Created by Dmitry Prokofyev on 13.05.2023.
//

import Foundation

fileprivate func initDateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "ru_RU")
    return dateFormatter
}

struct Action {
    static private let dateFormatter = initDateFormatter()

    let stateBefor: Int
    let actionType: ActionType
    let date: Date
    
    init(stateBefor: Int, actionType: ActionType) {
        self.stateBefor = stateBefor
        self.actionType = actionType
        self.date = Date.now
    }
    
    func asText() -> String {
        switch actionType {
        case .increased:
            return "[\(dateAsText)]: значение изменено на \(stateBefor) + 1"
        case .decreased:
            return "[\(dateAsText)]: значение изменено на \(stateBefor) - 1"
        case .zeroError:
            return "[\(dateAsText)]: попытка уменьшить значение счётчика ниже 0"
        case .reset:
            return "[\(dateAsText)]: значение сброшено"
        }
    }
    
    private var dateAsText: String {
        return Action.dateFormatter.string(from: date)
    }
}
