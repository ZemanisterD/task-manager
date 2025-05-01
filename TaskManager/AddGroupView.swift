import SwiftUI

struct AddGroupView: View {
    @Binding var isPresented: Bool
    @Binding var userCreatedGroups: [TaskGroup]
    @State private var groupTitle = ""
    @FocusState private var isTitleFieldFocused: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Group")
                .font(.headline)
                .padding(.top)
            
            TextField("Group Name", text: $groupTitle)
                .focused($isTitleFieldFocused)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .frame(width: 300)
            
            HStack(spacing: 20) {
                Button("Cancel") {
                    isPresented = false
                }
                .keyboardShortcut(.escape)
                
                Button("Add") {
                    if !groupTitle.isEmpty {
                        let newGroup = TaskGroup(title: groupTitle)
                        userCreatedGroups.append(newGroup)
                        isPresented = false
                    }
                }
                .keyboardShortcut(.return)
                .buttonStyle(.borderedProminent)
                .disabled(groupTitle.isEmpty)
            }
            .padding(.bottom)
        }
        .padding()
        .onAppear {
            isTitleFieldFocused = true
        }
    }
}


#Preview {
    struct PreviewWrapper: View {
        @State var isShowingModal = true
        @State var previewGroups: [TaskGroup] = TaskGroup.examples()
        
        var body: some View {
            AddGroupView(isPresented: $isShowingModal, userCreatedGroups: $previewGroups)
        }
    }
    
    return PreviewWrapper()
}
