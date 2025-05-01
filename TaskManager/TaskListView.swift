//
//  TaskListView.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task)
        }
        .toolbar {
            Button {
                tasks.append(Task(title: "New Task"))
            } label: {
                    Label("Add Task", systemImage: "plus")
                }
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()));
}
