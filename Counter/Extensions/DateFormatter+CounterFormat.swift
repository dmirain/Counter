//
//  DateFormatter+CounterFormat.swift
//  Counter
//
//  Created by Dmitry Prokofyev on 13.05.2023.
//

import Foundation

extension DateFormatter {
    static func counterFormat() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter
    }
}
