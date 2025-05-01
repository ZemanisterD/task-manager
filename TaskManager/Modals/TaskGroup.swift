//
//  TaskGroup.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var creationDate: Date
    var task: [Task]
    
    init(title: String, task: [Task] = []) {
        self.title = title
        self.creationDate = Date()
        self.task = task
    }
    
    static func example () -> TaskGroup {
        let task1 = Task(title: "Go to the mall")
        let task2 = Task(title: "Go to the gym")
        let task3 = Task(title: "Go to meet your girlfriend")
        let group = TaskGroup(title: "Today", task: [task1, task2, task3]);
        
        return group
    }
    
    static func examples () -> [TaskGroup] {
        let group1 = example()
        let group2 = TaskGroup(title: "New List");
        return [group1, group2]
    }
}
