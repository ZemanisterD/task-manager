//
//  TaskSection.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    case done
    case all
    case upcoming
    case list(TaskGroup)
 
    var id: String {
        switch self {
            case .done:
                "done"
            case .all:
                "all"
            case .upcoming:
                "upcoming"
            case .list(let group):
                group.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
            case .done:
                 "done"
            case .all:
                 "all"
            case .upcoming:
                 "upcoming"
            case .list(let group):
                 group.title
        }
    }
    
    var iconName: String {
        switch self {
            case .all:
                 "star"
            case .done:
                 "checkmark.circle"
            case .upcoming:
                 "calendar"
            case .list(_):
                 "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
