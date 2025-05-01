import SwiftUI

struct SidebarView: View {
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection
    @State private var isShowingAddGroupModal = false
    
    var body: some View {
        VStack(spacing: 0) {
            List(selection: $selection) {
                Section("Default"){
                    ForEach(TaskSection.allCases) { selection in
                        Label(selection.displayName, systemImage: selection.iconName).tag(selection)
                    }
                }
                Section("Your Groups") {
                    ForEach($userCreatedGroups) { $group in
                        HStack{
                            Image(systemName: "folder")
                            TextField("New Group", text: $group.title)
                        }
                        .tag(TaskSection.list(group))
                    }
                }
            }
            HStack {
                Button(action: {
                    isShowingAddGroupModal = true
                }) {
                    Label("Add Group", systemImage: "plus.circle")
                        .labelStyle(.iconOnly)
                    Text("Add Group")
                }
                .buttonStyle(.borderless)
                .foregroundColor(.accentColor)
                .padding()
                
                Spacer()
            }
            .overlay(
                Divider(), alignment: .top
            )
        }
        .listStyle(.sidebar)
        .sheet(isPresented: $isShowingAddGroupModal) {
            AddGroupView(isPresented: $isShowingAddGroupModal, userCreatedGroups: $userCreatedGroups)
                .frame(minWidth: 350, minHeight: 150)
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var userCreatedGroups = TaskGroup.examples()
        @State var selection: TaskSection = .all
        
        var body: some View {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
                .frame(width: 250, height: 400)
        }
    }
    
    return PreviewWrapper()
}
