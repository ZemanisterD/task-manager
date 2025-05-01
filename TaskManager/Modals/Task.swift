//
//  Task.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var details: String?
    
    init (title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.title = title;
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task {
        Task(title: "Go Home", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Pick up groceries", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Task(title: "Call dentist", dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
            Task(title: "Submit report", dueDate: Calendar.current.date(byAdding: .hour, value: 5, to: Date())!),
            Task(title: "Team meeting", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Task(title: "Renew passport", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            Task(title: "Pay utility bills", dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(title: "Gym session", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            Task(title: "Doctor appointment", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Task(title: "Fix bicycle", dueDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!),
            Task(title: "Birthday shopping", dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
        ]
    }
}
