//
//  ContentView.swift
//  TaskManager
//
//  Created by Zemanister Agues on 01/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var selection = TaskSection.all
    @State private var allTasks = Task.examples()
    @State private var searchTask: String = ""
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            if searchTask.isEmpty {
                switch selection {
                case .done:
                    StaticTaskListView(title: "All", tasks: allTasks.filter({$0.isCompleted}))
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .upcoming:
                    StaticTaskListView(title: "All", tasks: allTasks.filter({!$0.isCompleted}))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.task)
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({!$0.title.contains(searchTask)}))
            }
        }
        .searchable(text: $searchTask)
    }
}

#Preview {
    ContentView()
}
