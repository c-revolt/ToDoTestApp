//
//  Task.swift
//  ToDoTestApp
//
//  Created by Александр Прайд on 24.01.2023.
//

import Foundation

struct Task {
    let title: String?
    let description: String?
    private(set) var date: Date?
    let location: Location?
    
    init(title: String?, description: String? = nil, date: Date? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
        self.location = location
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title,
            rhs.description == lhs.description,
            lhs.location == rhs.location {
            return true
        }
        return false
    }
}
