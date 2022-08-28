//
//  DateFormatter.swift
//  RadioactiveCat
//
//  Created by Ellen Shapiro on 8/28/22.
//

import Foundation

struct SharedFormatters {
    static let date: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeZone = TimeZone(identifier: "US-CT")
        
        return formatter
    }()
}
