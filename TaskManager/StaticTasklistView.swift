//
//  TaskList.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import SwiftUI

struct StaticTaskListView: View {
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "circle.fill": "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    StaticTaskListView(title: "this is a test", tasks: Task.examples());
}
