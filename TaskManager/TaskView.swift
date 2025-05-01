//
//  TaskView.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import SwiftUI

struct TaskView: View {
    @Binding var task: Task
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "circle.fill": "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title).textFieldStyle(.plain)
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()))
}
